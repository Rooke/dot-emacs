mkdir ~/.emacs.d/
mkdir ~/.emacs.d/customizations
mv ./emacs.d/init.el ~/.emacs.d/init.el
mv -r ./emacs.d/customizations/ ~/.emacs.d/customizations/

sudo add-apt-repository ppa:kelleyk/emacs
sudo apt install emacs26 avfs build-essential

# Handy git
alias gcm='git checkout master'
alias gpm='git pull sortable master'
alias gd='git difftool --dir'
alias gsort='git branch --sort=committerdate'
alias gpp='git push --force origin HEAD'
export GPG_TTY=$(tty)

# Sortable-specific
alias lein='~/dev/tng/lein'
alias fj='~/dev/tng/fj'
alias sbt='~/dev/tng/sbt'

# Go
export PATH=$PATH:~/.nix-profile/bin:/usr/local/go/bin
export PATH=$PATH:/usr/local/go/bin
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin
