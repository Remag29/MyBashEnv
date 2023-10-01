#! /bin/bash

echo "Starting the script"

# Start with updating the system
echo "Updating the system..."
sudo apt update
sudo apt upgrade -y
echo "System updated !"

# Install dependencies
echo "Installing dependencies..."
sudo apt install unzip -y
echo "Dependencies installed !"

# Install and configure Starship
echo "Installing Starship..."
## Install Fonts
echo "  |--> Installing Fonts..."
sudo apt install fontconfig -y
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip -q
sudo unzip JetBrainsMono.zip -d /usr/share/fonts/
sudo rm /usr/share/fonts/readme.md
sudo rm /usr/share/fonts/OFL.txt
rm JetBrainsMono.zip
fc-cache -f -v

## Install Starship
echo "  |--> Installing Starship..."
sudo curl -fsSL https://starship.rs/install.sh | sh

## Edit .bashrc
echo "  |--> Editing .bashrc..."
echo 'eval "$(starship init bash)"' >> ~/.bashrc

## Download Starship config file
echo "  |--> Downloading Starship config file..."
mkdir -p ~/.config
wget https://raw.githubusercontent.com/Remag29/MyCustomShell/main/bash/starship.toml -q
mv starship.toml ~/.config/