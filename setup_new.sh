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
