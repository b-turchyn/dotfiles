dotfiles
========
My dotfiles. Contains configs for:

* [bspwm](https://github.com/baskerville/bspwm)
* [sxhkd](https://github.com/baskerville/sxhkd)
* [bar](https://github.com/LemonBoy/bar)
* [mpd](http://mpd.sourceforge.net/)
* [htop](http://hisham.hm/htop/)
* [tmux](http://tmux.sourceforge.net/)
* [vim](http://www.vim.org/)
* [zsh](http://www.zsh.org/) (with Oh-my-zsh!)

...and miscelaneous scripts to make the whole environment run.

Turns your Tmux+Vim experience into this!
[![](http://i.imgur.com/srFz4vul.png)](http://i.imgur.com/srFz4vu.png)

Requirements
------------
* [RVM](https://rvm.io)
* [Zsh](http://www.zsh.org)
* [Oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
* [Tmux](http://tmux.sourceforge.net/)
* [Powerline](https://github.com/Lokaltog/powerline)
* [Tewi Font](https://github.com/neeee/tewi-font)

...and probably some other things I haven't thought about.

Installation
------------
To install the dotfiles...

    git clone https://github.com/b-turchyn/dotfiles.git dotfiles
    cd dotfiles
    git submodule init
    git submodule update
    rake install
    vim -c :BundleInstall      # Expect errors during the first startup here

