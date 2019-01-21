mkdir ~/.emacs.d/
mkdir ~/.emacs.d/customizations
wget -O ~/.emacs.d/go-mode.el 'http://golang.org/misc/emacs/go-mode.el?m=text'
wget -O ~/.emacs.d/go-mode-load.el 'http://golang.org/misc/emacs/go-mode-load.el?m=text'
wget -O ~/.emacs.d/filladapt.el 'http://www.wonderworks.com/download/filladapt.el'
wget -O ~/.emacs.d/git.el 'https://raw.github.com/git/git/master/contrib/emacs/git.el'
wget -O ~/.emacs.d/git-blame.el 'https://raw.github.com/git/git/master/contrib/emacs/git-blame.el'
sudo apt-get install cscope-el ecb
mv ./emacs.d/init.el ~/.emacs.d/init.el
mv -r ./emacs.d/customizations/ ~/.emacs.d/customizations/

# Handy git
alias gcm='git checkout master'
alias gpm='git pull sortable master'
alias gd='git difftool --dir'
alias gsort='git branch --sort=committerdate'
alias gpp='git push --force origin HEAD'
export GPG_TTY=$(tty)

# Sortable-specific
alias restore_sortable='sudo $HOME/dev/tng/data/bin/restore_sortable -d data -r /mnt/d2/redis/redis-dev.rdb -l /mnt/d2/elasticsearch'
alias lein='~/dev/tng/lein'
alias fj='~/dev/tng/fj'
alias sbt='~/dev/tng/sbt'

# Go
export PATH=$PATH:~/.nix-profile/bin:/usr/local/go/bin
export PATH=$PATH:/usr/local/go/bin
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin
