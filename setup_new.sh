curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin launch=n

sudo ln -s ~/.local/kitty.app/bin/kitty /usr/local/bin/


cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/


cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/

sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop

sed -i "s|Exec=kitty|Exec=/home/$USER/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop


sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/local/bin/kitty 50


sudo update-alternatives --config x-terminal-emulator

curl -sS https://starship.rs/install.sh | sh

touch ~/.config/starship.toml

wget -c http://old-releases.ubuntu.com/ubuntu/pool/universe/r/rust-exa/exa_0.9.0-4_amd64.deb
sudo apt-get install ./exa_0.9.0-4_amd64.deb

sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update && sudo apt upgrade
sudo apt install fish -y
sudo chsh -s /usr/bin/fish

sudo apt install neofetch -y

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update

sudo apt install brave-browser

sudo apt install git

sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

sudo apt install apt-transport-https
sudo apt update
sudo apt install code


curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install nodejs -y
