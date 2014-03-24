dotfiles
========
Turns your Tmux+Vim experience into this!
[![](http://i.imgur.com/srFz4vul.png)](http://i.imgur.com/srFz4vu.png)

Requirements
------------
* [RVM](https://rvm.io)
* [Zsh](http://www.zsh.org)
* [Oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
* [Tmux](http://tmux.sourceforge.net/)
* [Powerline](https://github.com/Lokaltog/powerline)

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

