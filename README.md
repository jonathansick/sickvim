# sickvim: Jonathan Sick's Vim Configuration

### Dependencies

I use [rcm](https://github.com/thoughtbot/rcm) to manage dotfiles.
On a Mac with Homebrew, its easy to install:

```bash
brew tap thoughtbot/formulae
brew install rcm
```

(Linux platforms [are also supported](https://github.com/thoughtbot/rcm#installation))

Other dependencies:

```bash
brew install tags   # http://ctags.sourceforge.net/
brew install ack
```

Flake8 is also used by Syntastic.
Assuming that [pipsi](https://github.com/mitsuhiko/pipsi) is installed:

```bash
pipsi install flake8
```

For [linting ES6/JSX in Syntastic](https://jaxbot.me/articles/setting-up-vim-for-react-js-jsx-02-03-2015):

```bash
npm install -g eslint
npm install -g babel-eslint
npm install -g eslint-plugin-react
```


### Setting up MacVim

On a Mac, vim and MacVim.app can be installed and managed with [Homebrew][homebrew].

```bash
brew update
brew install macvim --custom-icons
brew link macvim
brew linkapps
```

MacVim can be launched on the command-line with `mvim`.
In my dotfiles I've set `vim` to point to the `vim` inside MacVim.app.

## Installation with rcm

Clone this repository and install the dotfiles:

```bash
git clone https://github.com/jonathansick/sickvim.git ~/sickvim
rcup -d ~/sickvim -x "README* LICENSE*"
```

Note that my normal workflow is to combine several rcm-managed dotfiles repositories and possibly use tags to customize the dotfile environment to a particular machine.
For instance, a personal Mac setup looks like this:

```bash
rcup -t mac -d ~/secret-dotfiles -d ~/sickvim -d ~/sickconfig
```

## Install Plugins

Plugins are managed with [vim-plug](https://github.com/junegunn/vim-plug).
Plugins are listed in vimrc.bundles.\* (including architecture-specific plugins sequestered in tag directories).

Once the sickvim dotfiles are installed with `rcup`, you can install the plugins via

```bash
vim +PlugInstall +qall
```

## Plugins

* [Solarized](https://github.com/altercation/vim-colors-solarized) colour theme from Ethan Schoonover. I use low visibility on "invisible" characters to keep an eye on tabs and carriage returns.
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
* Git — Syntax highlighting for git config files.
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
* [Markdown](https://github.com/tpope/vim-markdown) &mdash; markdown syntax highlighting.
* [latex-box](https://github.com/LaTeX-Box-Team/LaTeX-Box) — a bare-bones LaTeX environment, with latexmk to boot.
* [VimRoom](https://mikewest.github.io/vimroom/) — setup a clean writing layout with short line lengths. Enable with `<leader>V`. Pairs well with the `:WP` mode.
* [toml](https://github.com/cespare/vim-toml) for formatting [TOML](https://github.com/toml-lang/toml) files.

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

## Credits

My vim configuration is derived from work by [John Anderson][anderson].

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

