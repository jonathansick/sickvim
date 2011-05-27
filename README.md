Jonathan Sick's Vim Configuration
=================================

My vim configuration is derived from work by [John Anderson][anderson]. As also described in [a vimcast][submodulevimcast], plugins are installed as git submodules with [Pathogen][].

Features
--------

I use Ethan Schoonover's [Solarized][] colour theme, with low visibility on "invisible" characters.

These plugins are currently installed (my additions from Anderson's basic Python IDE setup are at the bottom):

* GunDo &mdash; Visual Undo in vim with diff's to check the differences
* Pytest &mdash; Runs your Python tests in Vim.
* Commant-T &mdash; Allows easy search and opening of files within a given path
* Snipmate &mdash; Configurable snippets to avoid re-typing common comands
* PyFlakes &mdash; Underlines and displays errors with Python on-the-fly
* Fugitive &mdash; Interface with git from vim
* Git &mdash; Syntax highlighting for git config files
* Minibufexpl &mdash; Visually display what buffers are currently opened
* Pydoc &mdash; Opens up pydoc within vim
* Surround &mdash; Allows you to surround text with open/close tags
* Py.test &mdash; Run py.test test's from within vim
* MakeGreen &mdash; Generic test runner that works with nose
* NERDTree &mdash; file system explorer, like TextMate's drawer
* Markdown &mdash; markdown syntax highlighting
* cython &mdash; pyrex and Cython syntax highlighting
* latexsuite &mdash; LaTeX IDE

Installation
------------

This project can be cloned as your .vim directory and the relevant dotfiles are linked into the home directory.

1. git clone ... ~/.vim
2. ln -s ~/.vim/vimrc ~/.vimrc
3. ln -s ~/.vim/gvimrc ~/.gvimrc
4. git submodule update --init
5. cd ~/.vim/bundle/command-t; rake make

Since plugins are submodules, they can be updating by issuing `git pull` within their respective directories in `bundle/`. 


[home]: http://www.jonathansick.ca
[anderson]: http://sontek.net/turning-vim-into-a-modern-python-ide
    Turning Vim into a Modern Python IDE
[submodulevimcast]: http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
    Synchronizing plugins with git submodules and pathogen
[Pathogen]: https://github.com/tpope/vim-pathogen
[Solarized]: http://ethanschoonover.com/solarized/vim-colors-solarized
