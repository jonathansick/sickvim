# sickvim

*Jonathan Sick's Vim Configuration*

My vim configuration is derived from work by [John Anderson][anderson]. As described in [a vimcast][submodulevimcast], plugins are installed as git submodules with [Pathogen][].

## Plugins

* [Solarized][] colour theme from Ethan Schoonover. I use low visibility on "invisible" characters to keep an eye on tabs and carriage returns.
* [Commentary](https://github.com/tpope/vim-commentary) to toggle comments on source files.
  - Comment lines with `gcc`. Accepts a count, eg. `2gcc`.
  - Comment a paragraph with `gcap` (or any motion with `gc`).
  - `gc` also works in visual mode.
* [Surround](https://github.com/tpope/vim-surround) — Allows you to surround text with open/close tags. It provides three operations:
  - `cs` changes surroundings. E.g. `cs"'` to change quotes from `"` to `'`.
  - `ys` wraps an object in a surrounding. E.g. `ysiw<em>` to wrap a word in `<em>` tags. Or `yss)` to wrap a line in parentheses.
  - `ds` deletes the surrounding. E.g. `ds{` to delete the `{` surrounding a word.
* [repeat](https://github.com/tpope/vim-repeat) — support the dot command with plugin maps (like in surround.vim and commentary.vim).
* TagList — list and jump between functions in your source using CTags
  - `,tags` toggles the TagList pane
* [Obsession](https://github.com/tpope/vim-obsession) — session persistence. Works great with the [tmux-continuum](https://github.com/tmux-plugins/tmux-continuum) plugin.
* [Syntastic](https://github.com/scrooloose/syntastic) — multi-lingual syntax checking. I use `flake8` to do style on syntax checking on Python code. See `ftplugin/python.vim` for my PEP8 exceptions.
* [Supertab](https://github.com/ervandew/supertab) to handle completions with a tab. I'm looking to switch to YouCompleteMe for this task, though.
* [NERDTree](https://github.com/scrooloose/nerdtree) — trusty file system explorer, like TextMate's drawer. Toggle the pane with `,n`.
* [lusty](https://github.com/sjbach/lusty/) to make it easy to switch between buffers.
  - `,lj` brings up a list of recent buffers. Press a letter on home row to select that buffer then press they key again to switch to it.
* [GunDo](http://sjl.bitbucket.org/gundo.vim/) — Visual Undo in vim with diff's to check the differences. See [this vimcast](http://vimcasts.org/episodes/undo-branching-and-gundo-vim/) for more details.
  - `,g` to load the `gundo` window.
* [Ultisnips](https://github.com/SirVer/ultisnips) — Configurable snippets to avoid re-typing common code fragments.
  - For python files:
    + `mplimp` imports lots of `matplotib modules
    + `ooplot` roughs out an object-oriented `matplotlib` plot
    + `docp` adds a numpydoc-style parameter item for the docstring.
    + `def` and `class` do what you'd expect
  - For LaTeX files:
    + `sec` and `eq` do what you'd expect.
    + **TODO** document more snippets.
* [Fugitive](https://github.com/tpope/vim-fugitive) — Interface with git from vim.
* Git &mdash; Syntax highlighting for git config files.
* [eunuch](https://github.com/tpope/vim-eunuch) &mdash; provides handy syntactic sugar for Unixy stuff in vim. Here's the rundown from Tim Pope's documentation:
  - `:Unlink`: Delete a buffer and the file on disk simultaneously.
  - `:Remove`: Like `:Unlink`, but doesn't require a neckbeard.
  - `:Move`: Rename a buffer and the file on disk simultaneously.
  - `:Chmod`: Change the permissions of the current file.
  - `:Mkdir`: Create a directory, defaulting to the parent of the current file.
  - `:Find`: Run `find` and load the results into the quickfix list.
  - `:Locate`: Run `locate` and load the results into the quickfix list.
  - `:Wall`: Write every open window.  Handy for kicking off tools like [guard][].
  - `:SudoWrite`: Write a privileged file with `sudo`.
  - `:SudoEdit`: Edit a privileged file with `sudo`.
  - File type detection for `sudo -e` is based on original file name.
  - New files created with a shebang line are automatically made executable.
* Pydoc &mdash; Opens up pydoc within vim
* [Markdown](https://github.com/tpope/vim-markdown) &mdash; markdown syntax highlighting.
* [latex-box](https://github.com/LaTeX-Box-Team/LaTeX-Box) — a bare-bones LaTeX environment, with latexmk to boot.
* [Autoformat](https://github.com/Chiel92/vim-autoformat) — to clean up code formatting. Potentially useful when fixing someone else's code, right? I'm not happy with the way to formats Python code, though.
  - `:Autoformat` to format the entire file
  - `gq` to format a visual selection.
* [VimRoom](https://mikewest.github.io/vimroom/) — setup a clean writing layout with short line lengths. Enable with `<leader>V`. Pairs well with the `:WP` mode.
* [toml](https://github.com/avakar/pytoml) for formatting [TOML](https://github.com/toml-lang/toml) files.

## Other features/mappings

* Leader is `,`
* `kj` is equivalent to `<Tab>` for getting into normal mode.
* `ctrl-j/k/l/m` changes splits in the specific direction.
* [formd](http://drbunsen.github.io/formd/) to convert between different markdown linking styles.
  - `,fr` to run `formd -r` and convert links to reference style.
  - `,fi` to run `formd -i` and convert links to inline style.
* `:WP` to turn on 'word processing mode.' Bumps font size and line spacing for MacVim, turns on spell checking. Use `:SyntasticToggleMode` to turn off syntastic flags. Of course, works well with `<leader>V` for WriteRoom mode.
* `,vimdc` to edit the `.vimrc` file and reload upon save.
* I make heavy use of `ftplugin` to configure language-specific settings. So check out the `ftplugin/` directory.

## Installation

This project can be cloned as your `~.vim` directory and the relevant dotfiles are linked into the home directory.

Let the bootstrap script take care of it:

    curl -L https://raw.github.com/jonathansick/sickvim/master/bootstrap.sh | bash

By default this sets the Github remote protocol to HTTPS.
If you're *me*, you can switch it to SSH access by manually calling

    ~/.vim/enable_github.sh

### Dependencies

If you don't have them, you'll also need to install the dependencies.

1. Flake8 &mdash; `pip install flake8` for the syntasic plugin.
2. Ack &mdash; e.g. `brew install ack` (using [Homebrew][homebrew])
4. tags &mdash; Download from http://ctags.sourceforge.net/

### Setting up MacVim

On a Mac, vim and MacVim.app can be installed and managed with [Homebrew][homebrew].

    brew update
    brew install macvim --custom-icons
    brew link macvim
    brew linkapps

MacVim can be launched on the command-line with `mvim`.
In my dotfiles I've set `vim` to point to the `vim` inside MacVim.app.

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

**Note:** in the future it will be possible to simply do `git rm bundle/plugin_name` with new-style (`gitfile`-based submodules).

[home]: http://www.jonathansick.ca
[dotfiles]: https://github.com/jonathansick/dotfiles
[anderson]: http://sontek.net/turning-vim-into-a-modern-python-ide
    "Turning Vim into a Modern Python IDE"
[submodulevimcast]: http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
    "Synchronizing plugins with git submodules and pathogen"
[Pathogen]: https://github.com/tpope/vim-pathogen
[Solarized]: http://ethanschoonover.com/solarized/vim-colors-solarized
[dirty]: http://www.nils-haldenwang.de/frameworks-and-tools/git/how-to-ignore-changes-in-git-submodules
    "How to ignore changes in git submodules"
[homebrew]: http://mxcl.github.com/homebrew/ "Homebrew"
