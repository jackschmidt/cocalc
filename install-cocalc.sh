#! /bin/bash

pushd ~
bold=$(tput bold)
normal=$(tput sgr0)
becho () {
    echo ${bold}$*${normal}
}

echo
becho "Configure git"
git config --global push.default simple

echo
becho "Clone the cocalc xandbox into your project home directory"
pushd ~
git init
git remote add origin https://github.com/xandbox/cocalc.git
git fetch --all
git reset --hard origin/master

echo
becho "Clone the git submodules"
git submodule update --init --remote
popd

echo
becho "Import the xandbox private key"
gpg --import ~/gpg/xandbox.txt

pushd ~/xandbox
if [[ $(git config user.name) ]]; then
    echo "Your git username is $(git config user.name)"
else
    echo
    becho "Set your git user.name"
    git config user.name "Ximera Sandbox"
    git config user.email "ximera@math.osu.edu"
fi

popd

echo
becho "Reload .bashrc"
source ~/.bashrc

echo
becho "Done!"
