#!/usr/bin/env bash

echo "install.sh"

echo "Copying dotfiles ..."

echo "STEP: .gitconfig and .gitignore_global"
cp -r ~/dotfiles/git/.gitconfig ~/dotfiles/git/.gitignore_global ~

echo "STEP: copy config.json to code-server directory"
PATH_CS_1="$HOME/.local/share/code-server/User"
PATH_VS_1="$HOME/Library/Application Support/Code/User"
COMMAND="cp ./Code/User/settings.json"

if [ -d $PATH_CS_1 ]; then
    echo 'code-server folder exists, copying settings.json'
    $COMMAND $PATH_CS_1
fi

if [ -d "$PATH_VS_1" ]; then
    echo 'VS Code exists, copying settings.json'
    $COMMAND "$PATH_VS_1"
fi



echo "STEP: install fish shell"

FISH_BINARY=/usr/bin/fish
FISH_PATH=/usr/bin

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if [ ! -f $FISH_BINARY ] ; then
        sudo apt-get update
        sudo apt-get install -y fish
        echo "installing fish in $FISH_PATH"
    else
        echo "fish already installed"
    fi
fi


# locations for VS Code settings.json
# Mac $HOME/Library/Application Support/Code/User/
# Linux $HOME/.config/Code/User/
# locations for code-server settings.json
# $HOME/.local/share/code-server/User