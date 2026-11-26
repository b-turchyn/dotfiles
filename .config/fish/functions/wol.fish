function wol --description 'Send a Wake-on-LAN magic packet'
    if test (count $argv) -ne 1
        echo "Usage: wol <MAC-address>" >&2
        return 2
    end

    set -l mac (string replace -ar '[:-]' '' -- $argv[1])
    if not string match -rq '^[0-9A-Fa-f]{12}$' -- $mac
        echo "Invalid MAC address: $argv[1]" >&2
        return 2
    end

    # 6 bytes of 0xff followed by the MAC repeated 16 times.
    set -l packet (string repeat -n 6 '\xff')(string repeat -n 16 (string escape --style=var $mac))
    # Generate binary packet with Python; send it as a UDP broadcast.
    python3 -c '
import socket, sys
mac = bytes.fromhex(sys.argv[1])
packet = b"\xff" * 6 + mac * 16
sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
sock.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)
sock.sendto(packet, ("255.255.255.255", 9))
' $mac
end

