# Jonathan Sick's Vim Configuration

My vim configuration is derived from work by [John Anderson][anderson]. As described in [a vimcast][submodulevimcast], plugins are installed as git submodules with [Pathogen][].

## Features

I use Ethan Schoonover's [Solarized][] colour theme, with low visibility on "invisible" characters.

These plugins are currently installed:

* [commentary](https://github.com/tpope/vim-commentary) &mdash; Comment lines with `\\\` and comment a paragraph with `\\ap`. Notes these are toggles!
* [repeat](https://github.com/tpope/vim-repeat) &mdash; support the dot command with plugin maps (like in surround.vim and commentary.com).
* TagList &mdash; list and jump between functions in your source using CTags
* [Syntastic](https://github.com/scrooloose/syntastic) &mdash; multi-lingual syntax checking.
* [Surround](https://github.com/tpope/vim-surround) &mdash; Allows you to surround text with open/close tags
* NERDTree &mdash; file system explorer, like TextMate's drawer
* Minibufexpl &mdash; Visually display what buffers are currently opened
* GunDo &mdash; Visual Undo in vim with diff's to check the differences
* Pytest &mdash; Runs your Python tests in Vim.
* Command-T &mdash; Allows easy search and opening of files within a given path
* Snipmate &mdash; Configurable snippets to avoid re-typing common comands
* Fugitive &mdash; Interface with git from vim
* Git &mdash; Syntax highlighting for git config files
* Pydoc &mdash; Opens up pydoc within vim
* Py.test &mdash; Run py.test test's from within vim
* MakeGreen &mdash; Generic test runner that works with nose
* [Markdown](https://github.com/tpope/vim-markdown) &mdash; markdown syntax highlighting
* cython &mdash; pyrex and Cython syntax highlighting
* latex-box &mdash; a bare-bones LaTeX environment, with latexmk to boot

## Installation

This project can be cloned as your `~.vim` directory and the relevant dotfiles are linked into the home directory.

Let the bootstrap script take care of it:

    curl -L https://raw.github.com/jonathansick/sickvim/master/bootstrap.sh | bash

By default this sets the Github remote protocol to HTTPS.
If you're *me*, you can switch it to SSH access by manually calling

    ~/.vim/enable_github.sh

### Dependencies

If you don't have them, you'll also need to install the dependencies.

1. Flakes8 &mdash; `pip install flakes8` for syntasic plugin
2. Ack &mdash; e.g. `sudo brew install ack` (using [Homebrew][homebrew])
3. Rope &mdash; `sudo easy_install rope; sudo easy_install ropemode`
4. tags &mdash; Download from http://ctags.sourceforge.net/

## Updating this Vim setup

Updating the Vim directory requires two steps. First, pull changes from Github:

    git pull origin master
	git submodule update

then update plugins,

	 git submodule foreach git pull origin master

If any plug-ins were updated, those can be pushed back to Github

    git commit *bundles* -m "Updated plug-ins"
    git push origin master

When other users pull that commit and update their submodules, this git repository should be clean.

## Adding and removing plugins

Additional plugins can be installed via the procedure

1. `cd ~/.vim`
2. `git submodule add bundle_url bundle/yourbundlename`
3. `git submodule init`

In  `~/.vim/.gitmodules`, it is useful add the line

    ignore = dirty

to each submodule. This prevents help tag generation from creating the illusion of the plugins changing. See [Nils Haldenwang's blog for details.][dirty]

To remove a plugin

1. Delete the relevant line from the `.gitmodules` file.
2. Delete the relevant section from `.git/config`.
3. Run `git rm --cached path_to_submodule` (**no trailing slash**).
4. Commit and delete the now untracked submodule files.

(See [this Stack Overflow answer for removing submodules](http://stackoverflow.com/questions/1260748/how-do-i-remove-a-git-submodule).)

[home]: http://www.jonathansick.ca
[anderson]: http://sontek.net/turning-vim-into-a-modern-python-ide
    "Turning Vim into a Modern Python IDE"
[submodulevimcast]: http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
    "Synchronizing plugins with git submodules and pathogen"
[Pathogen]: https://github.com/tpope/vim-pathogen
[Solarized]: http://ethanschoonover.com/solarized/vim-colors-solarized
[dirty]: http://www.nils-haldenwang.de/frameworks-and-tools/git/how-to-ignore-changes-in-git-submodules
    "How to ignore changes in git submodules"
[homebrew]: http://mxcl.github.com/homebrew/ "Homebrew"
