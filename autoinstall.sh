#!/bin/sh

CONFIG_URL=https://github.com/vadim-pavlov/vim-config/archive/master.tar.gz
CONFIG_DIR=~/vim-config
VIMRC_PATH=~/.vimrc

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
    read -r -p "$1 [y/N] " response
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

    vim +PluginInstall +qall || fail

    echo "Done."

}

install_config
