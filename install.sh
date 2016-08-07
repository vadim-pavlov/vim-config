#!/bin/sh

CONFIG_URL=https://github.com/vadim-pavlov/vim-config/archive/master.tar.gz
CONFIG_DIR=~/vim-config
VIMRC_PATH=~/.vimrc
VIM_AUTOLOAD_DIR=~/.vim/autoload
PLUG_URL=https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

die() {
    echo "$1" >&2
    exit 1
}

abort() {
    die "Aborted."
}

fail() {
    die "Failure."
}

confirm_or_abort() {
    read -r -p "$1 [y/N] " response < /dev/tty
    if ! echo $response | grep -qE '[yY][eE][sS])|[yY]'; then
        abort
    fi
}

install_config () {

    if [ -e "$CONFIG_DIR" ]; then
        confirm_or_abort "$CONFIG_DIR alreay exists. Overwrite?"
    fi

    rm -rf "$CONFIG_DIR"
    mkdir -p "$CONFIG_DIR"
    cd "$CONFIG_DIR" || fail

    wget "$CONFIG_URL" || fail

    tar -xf master.tar.gz --strip-components=1 || fail

    rm master.tar.gz

    if [ -e "$VIMRC_PATH" ]; then
        confirm_or_abort "$CONFIG_DIR alreay exists. Overwrite?"
    fi

    rm -f "$VIMRC_PATH"
    ln -s "$CONFIG_DIR/vimrc" "$VIMRC_PATH" || fail

    mkdir -p "$VIM_AUTOLOAD_DIR"

    wget -O "$VIM_AUTOLOAD_DIR/plug.vim" "$PLUG_URL"

    vim +PlugInstall +qall </dev/tty >/dev/tty 2>&1 || fail

    echo "Done."

}

install_config
