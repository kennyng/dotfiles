#!/bin/bash
###############################################################################
# setup-configuration.sh
# -----------------------
# Create symbolic links to configuration files.
# usage: ./setup-configuration [-Abtv] <absolute_path_to_repo>
#
# `steup-configuration` **options** (any combination of the following):
#   `-A`    (all configurations)
#   `-b`    (Bash)
#   `-t`    (tmux)
#   `-v`    (Vim)
#
###############################################################################


# Check for Bash (>2.0).
if [ ! "$BASH_VERSINFO" ] ; then
    return
fi

while getopts Abetvp name
do
    case $name in
        A)
            bash_opt=1;
            tmux_opt=1;
            vim_opt=1;;
        b)bash_opt=1;;
        t)tmux_opt=1;;
        v)vim_opt=1;;
        *)echo "usage: ./setup-configuration [-Abtv]";;
    esac
done

config_repo_path=$(pwd)

if [[ -n $bash_opt ]] ; then
    echo "Configuring Bash..."
    bash_dir=${config_repo_path%%/}/bash
    bash_profile=${bash_dir%%/}/bash_profile
    bashrc=${bash_dir%%/}/bashrc
    bashrc_dir=${bash_dir%%/}/bashrc.d
    bash_logout=${bash_dir%%/}/bash_logout
    profile_symlink=$HOME/.bash_profile
    bashrc_symlink=$HOME/.bashrc
    bashrc_dir_symlink=$HOME/.bashrc.d
    logout_symlink=$HOME/.bash_logout

    if [[ -f $profile_symlink ]] ; then
        echo "ERROR: '$profile_symlink' already exists."
    else
        ln -s "$bash_profile" "$profile_symlink"
        echo "> Created symbolic link: $profile_symlink"
    fi

    if [[ -f $bashrc_symlink ]] ; then
        echo "ERROR: '$bashrc_symlink' already exists."
    else
        ln -s "$bashrc" "$bashrc_symlink"
        echo "> Created symbolic link: $bashrc_symlink"
    fi
    if [[ -f $bashrc_dir_symlink ]] ; then
        echo "ERROR: '$bashrc_dir_symlink' already exists."
    else
        ln -s "$bashrc_dir" "$bashrc_dir_symlink"
        echo "> Created symbolic link: $bashrc_dir_symlink"
    fi
    if [[ -f $logout_symlink ]] ; then
        echo "ERROR: '$logout_symlink' already exists."
    else
        ln -s "$bash_logout" "$logout_symlink"
        echo "> Created symbolic link: $logout_symlink"
    fi

    unset bash_dir bash_profile bashrc bashrc_dir logout
    unset profile_symlink bashrc_symlink bashrc_dir_symlink logout_symlink
    unset bash_opt
fi


if [[ -n $tmux_opt ]] ; then
    echo "Configuring tmux..."
    tmux_dir=${config_repo_path%%/}/tmux
    tmux_conf=${tmux_dir%%/}/tmux.conf
    tmux_dir_symlink=$HOME/.tmux
    tmux_conf_symlink=$HOME/.tmux.conf

    if [[ -d $tmux_dir_symlink ]]; then
        echo "ERROR: '$tmux_dir_symlink' already exists."
    else
        ln -s "$tmux_dir" "$tmux_dir_symlink"
        echo "> Created symbolic link: $tmux_dir_symlink"
    fi

    if [[ -f $tmux_conf_symlink ]] ; then
        echo "ERROR: '$tmux_conf_symlink' already exists."
    else
        ln -s "$tmux_conf" "$tmux_conf_symlink"
        echo "> Created symbolic link: $tmux_conf_symlink"
    fi

    unset tmux_dir tmux_conf tmux_dir_symlink tmux_conf_symlink tmux_opt
fi


if [[ -n $vim_opt ]] ; then
    echo "Configuring Vim..."
    vim_dir=${config_repo_path%%/}/vim
    vim_conf=${vim_dir%%/}/vimrc
    vim_colors=${vim_dir%%/}/colors
    vim_conf_symlink=$HOME/.vimrc
    vim_colors_symlink=$HOME/.vim/colors

    if [[ -f $vim_conf_symlink ]] ; then
        echo "ERROR: '$vim_conf_symlink' already exists."
    else
        ln -s "$vim_conf" "$vim_conf_symlink"
        echo "> Created symbolic link: $vim_conf_symlink"
    fi

    if [[ -d $vim_colors_symlink ]] ; then
        echo "ERROR: '$vim_colors_symlink' already exists."
    else
        ln -s "$vim_colors" "$vim_colors_symlink"
        echo "> Created symbolic link: $vim_colors_symlink"
    fi

    unset vim_dir vim_conf vim_colors
    unset vim_conf_symlink vim_colors_symlinks vim_opt
fi

unset config_repo_path
