#! /bin/bash

pushd ~
bold=$(tput bold)
normal=$(tput sgr0)
becho () {
    echo ${bold}$*${normal}
}

git config --global push.default simple

pushd ~
git init
git remote add origin https://github.com/xandbox/cocalc.git
git fetch --all
git reset --hard origin/master
git submodule update --init
popd

pushd ~/xandbox
if [[ $(git config user.name) ]]; then
    becho "Your git username is $(git config user.name)"
else
    becho "Setting git user.name"
    git config user.name "Ximera Sandbox"
    git config user.email "ximera@math.osu.edu"
fi

popd

becho "Done."
