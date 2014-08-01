### dotfiles

Portable configurations for bash, emacs, tmux, and vim that I use daily for development on Mac OSX and remote Linux servers.

+ bash:
    + .bash_profile - Basic configurations and commonly-used aliases for bash shell. It sources `~/.profile` (where I put PATH environment stuff) and `~/.bashrc` (where I put local aliases).

+ emacs:
    + .emacs - Minimal configurations for emacs (use emacs only to occasionally play [GNU Go]() since switching to vim).

+ tmux (1.8+):
    + .tmux.conf - Intuitive configurations, easy window/pane management, improved key bindings, and status bar customizations for tmux.
    + tmux/ - Includes session profiles, status bar customization scripts, and OSX-specific configurations.

+ vim (7+):
    + .vimrc - Sensible configurations, key (re)mappings, and plugins for vim. Plugins are managed using [Vundle]().
    + vim/colors - Some colorschemes that I like.

### usage

After cloning this git repository, symbolic links to the configuration files can be created by executing the `config_setup` bash script.

'''sh
$ git clone https://github.com/kennyng/dotfiles
$ cd *<path-to-git-repo>*
$ ./config_setup [-A][-b][-e][-t][-v]  *<absolute-path-to-git-repo>*
'''

*config_setup options* (any combinations of the following):
    + `-A`    (all configurations; `./config_setup -A` equivalent to `./config_setup -b -e -t -v`)
    + `-b`    (bash only)
    + `-e`    (emacs only)
    + `-t`    (tmux only)
    + `-v`    (vim only)

**Note**:
    + No symbolic links are created by `config_setup` if [file/directory/symbolic link] name already exists. Remove existing before running `config_setup`.
    + For vim plugins to work, Vundle must be first installed. See [instructions]().

### screenshot
