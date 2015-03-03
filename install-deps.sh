# from Paul Irish: https://github.com/paulirish/dotfiles/blob/master/install-deps.sh

# install jshint
npm install jshint -g

# install csslint
npm install csslint -g

# VIM - install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# VIM - install plugins
# see instructions in .vim/bundle/README

# make default directory
mkdir ~/code && cd ~/code

# https://github.com/rupa/z
# z, oh how i love you
cd ~/code
git clone https://github.com/rupa/z.git
chmod +x ~/code/z/z.sh
cd

# for the c alias (syntax highlighted cat)
sudo easy_install Pygments

# tmuxifier for smarter session handling
git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier

# setting up environment for python
sudo easy_install pip
pip install virtualenv
