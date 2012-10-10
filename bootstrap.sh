#!/bin/bash

# sickvim bootstrap script!
# Get it rolling with:
# curl -L https://raw.github.com/jonathansick/sickvim/master/bootstrap.sh | bash

DOTVIM=$HOME/.vim

if [ -d $DOTVIM ]; then
    echo "You already seem to have a sick vim setup."
    exit 1;
fi

# Get it
git clone https://github.com/jonathansick/sickvim.git $DOTVIM
cd $DOTVIM
git submodule update --init

# Link it
ln -Ffs $DOTVIM/vimrc $DOTVIM/.vimrc
ln -Ffs $DOTVIM/gvimrc $DOTVIM/.gvimrc
ln -Ffs $DOTVIM/ctags.conf $DOTVIM/.ctags

# Compile Command-t
(cd $DOTVIM/bundle/command-t; rake make)

# You'll have to do this last step manually
# cd $DOTVIM/doc/; vim` then run `:helptags .`
