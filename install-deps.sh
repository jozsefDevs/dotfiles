# from Paul Irish: https://github.com/paulirish/dotfiles/blob/master/install-deps.sh

# install jshint
npm install jshint -g

# VIM - install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# VIM - install plugins
cd ~/.vim/bundle && git clone https://github.com/kien/ctrlp.vim
cd ~/.vim/bundle && git clone https://github.com/editorconfig/editorconfig-vim
cd ~/.vim/bundle && git clone https://github.com/mattn/emmet-vim
cd ~/.vim/bundle && git clone https://github.com/scrooloose/syntastic

cd ~/.vim/bundle && git clone https://github.com/marijnh/tern_for_vim
cd ~/.vim/bundle/tern_for_vim && npm install

cd ~/.vim/bundle && git clone https://github.com/bling/vim-airline
cd ~/.vim/bundle && git clone https://github.com/nathanaelkane/vim-indent-guides.git
cd ~/.vim/bundle && git clone https://github.com/pangloss/vim-javascript.git
cd ~/.vim/bundle && hg clone https://bitbucket.org/ludovicchabant/vim-lawrencium
cd ~/.vim/bundle && git clone https://github.com/mhinz/vim-signify
cd ~/.vim/bundle && git clone https://github.com/duganchen/vim-soy

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
