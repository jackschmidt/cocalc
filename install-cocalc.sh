#! /bin/bash

# From https://serverfault.com/questions/607884/hide-the-output-of-a-shell-command-only-on-success
set -e

SILENT_LOG=/tmp/silent_log_$$.txt
trap "/bin/rm -f $SILENT_LOG" EXIT

function report_and_exit {
    cat "${SILENT_LOG}";
    echo "\033[91mError running command.\033[39m"
    exit 1;
}

function silent {
    echo -ne $*
    $* 2>>"${SILENT_LOG}" >> "${SILENT_LOG}" && echo -ne " ... done!" || report_and_exit;
}

bold=$(tput bold)
normal=$(tput sgr0)
becho () {
    echo ${bold}$*${normal}
}

pushd ~ 

becho "Configure git"
silent git config --global push.default simple

becho "Clone the cocalc xandbox into your project home directory"
silent git init
silent git remote add origin https://github.com/xandbox/cocalc.git
silent git fetch --all
silent git reset --hard origin/master

becho "Clone the git submodules"
silent git submodule update --init --remote

popd

becho "Import the xandbox private key"
silent gpg --import ~/gpg/xandbox.txt

pushd ~/xandbox
if [[ $(git config user.name) ]]; then
    echo "Your git username is $(git config user.name)"
else
    echo
    becho "Set your git user.name"
    silent git config user.name "Ximera Sandbox"
    silent git config user.email "ximera@math.osu.edu"
fi

popd

becho "Reload .bashrc"
source ~/.bashrc

becho "Done!"
