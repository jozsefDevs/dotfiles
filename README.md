My DotFiles
========

Based on dotfiles of Paul Irish. https://github.com/paulirish/dotfiles

## Make sure these hard dependencies are installed by default

node: http://nodejs.org/

1. Download latest node bins for linux 64 bit && extract it to ~/installs/<nodever>
2. ` mkdir ~/bin && cd ~/bin && ln -s ~/installs/<nodever>/bin/node node && ln -s ~/installs/<nodever>/bin/npm npm`

tmux: http://tmux.sourceforge.net/

ag: (a.k.a. silver searcher): https://github.com/ggreer/the_silver_searcher

editorconfig: http://editorconfig.org/

## ...after that

1. Clone this repo and copy its contents to ~
2. Install dependencies through `sudo install-deps.sh`
3. Set terminal background to black and font color to some grey
4. Follow instructions in ~/.fonts/README.md for getting Powerline fonts
5. Logout and log in!
6. Go through all your vim plugins to check whether they are configured & installed properly.
