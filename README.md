# dotfiles

Portable dotfiles that I use for development on Mac OSX and remote Linux servers.

This repository contains configurations for the following:
+ [Bash](https://www.gnu.org/software/bash/) (GNU Bourne-Again Shell, 3.2+):
    + `.bash_profile` - Sources `~/.profile` (not committed file where I put PATH and other environment stuff) and `~/.bashrc.
    + `.bashrc` - Bash shell configurations; sources `.bashrc.d/`.
    + `.bashrc.d/` - Contains scripts, functions, and aliases for Bash shell.

+ [emacs](http://www.gnu.org/software/emacs/) (GNU Emacs, text editor, 22+):
    + `.emacs` - Minimal configurations for emacs (use emacs only to occasionally play [GNU Go](http://www.gnu.org/software/gnugo/) since switching to vim).

+ [tmux](http://tmux.sourceforge.net/) (Terminal multiplexer, 1.8+):
    + `.tmux.conf` - Intuitive configurations, easy window/pane management, improved key bindings, and status bar customizations for tmux.
    + `tmux/` - Includes session profiles, status bar customization scripts, and OSX-specific configurations.

+ [Vim](http://www.vim.org/) (Vi IMproved, text editor, 7+):
    + `.vimrc` - Sensible configurations, key (re)mappings, and plugins for vim. Plugins are managed using [Vundle](http://github.com/gmarik/vundle).
    + `vim/colors` - Some colorschemes that I like.

## usage

After cloning this git repository, symbolic links to the configuration files can be created by executing the `config_setup` bash script.

```sh
$ git clone https://github.com/kennyng/dotfiles
$ cd <path-to-git-repo>
$ ./config_setup [-betvA]
```

`config_setup` **options** (any combination of the following):
+ `-b`    (Bash only)
+ `-e`    (emacs only)
+ `-t`    (tmux only)
+ `-v`    (Vim only)
+ `-A`    (all configurations; `./config_setup -A` equivalent to `./config_setup -betv`)

**Note**:
+ No symbolic links are created by `config_setup` if [file/directory/symbolic link] name already exists. Remove existing before running `config_setup`.
+ For vim plugins to work, Vundle must be first installed. See [instructions](https://github.com/gmarik/Vundle.vim#quick-start).

## screenshot

![screenshot of tmux status bar, vim colorscheme, and panes/windows/plugins](http://i.imgur.com/dDIJMxy.png?1 "screenshot")
