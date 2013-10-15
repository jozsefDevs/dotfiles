# from Paul Irish: https://github.com/paulirish/dotfiles/blob/master/install-deps.sh

# install jshint
npm install jshint -g

# VIM - install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle; \
curl -Sso ~/.vim/autoload/pathogen.vim \
    https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

# VIM - install jshint plugin
cd ~/.vim/bundle &&  git clone https://github.com/walm/jshint.vim

# make default directory
mkdir ~/code && cd ~/code

# https://github.com/rupa/z
# z, oh how i love you
cd ~/code
git clone https://github.com/rupa/z.git
chmod +x ~/code/z/z.sh

# for the c alias (syntax highlighted cat)
sudo easy_install Pygments
