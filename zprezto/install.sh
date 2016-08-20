sudo apt-get install zsh
cd
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
chsh -s /bin/zsh
cp ~/.zprezto/runcoms/zshrc ~/
mv ~/zshrc ~/.zshrc
cp .zpreztorc ~/
sudo reboot
