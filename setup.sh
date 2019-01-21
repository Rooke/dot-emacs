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
