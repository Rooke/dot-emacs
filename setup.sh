mkdir ~/.emacs.d/
wget -O ~/.emacs.d/go-mode.el 'http://golang.org/misc/emacs/go-mode.el?m=text'
wget -O ~/.emacs.d/go-mode-load.el 'http://golang.org/misc/emacs/go-mode-load.el?m=text'
wget -O ~/.emacs.d/filladapt.el 'http://www.wonderworks.com/download/filladapt.el'
wget -O ~/.emacs.d/git.el 'https://raw.github.com/git/git/master/contrib/emacs/git.el'
wget -O ~/.emacs.d/git-blame.el 'https://raw.github.com/git/git/master/contrib/emacs/git-blame.el'
git clone https://github.com/m2ym/rsense ~/.emacs.d/rsense
git clone https://github.com/emacsmirror/ecb.git ~/.emacs.d/ecb
git clone https://github.com/auto-complete/popup-el ~/.emacs.d/popup-el
git clone https://github.com/emacsmirror/cedet ~/.emacs.d/cedet
git clone https://github.com/emacsmirror/cscope ~/.emacs.d/cscope
git clone https://github.com/emacsmirror/haskell-mode ~/.emacs.d/haskell-mode
git clone https://github.com/auto-complete/auto-complete.git ~/.emacs.d/auto-complete
sudo apt-get install w3m-el cscope-el ecb

chdir ~/.emacs.d/cedet
make

