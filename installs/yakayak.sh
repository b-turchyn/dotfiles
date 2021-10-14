#!/usr/bin/env bash

version=1.5.3

wget -O /tmp/yakyak-${version}.deb https://github.com/yakyak/yakyak/releases/download/v${version}/yakyak-${version}-linux-amd64.deb

sudo dpkg -i /tmp/yakyak-${version}.deb
