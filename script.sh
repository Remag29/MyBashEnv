#! /bin/bash

echo "Starting the script"

# Install dependencies
echo "Installing dependencies..."
sudo apt install curl -y
sudo apt install unzip -y
echo "Dependencies installed !"

# Start with updating the system
echo "Updating the system..."
sudo apt update
sudo apt upgrade -y
echo "System updated !"

# Install and configure Starship
echo "Installing Starship..."
## Install Fonts
echo "  |--> Installing Fonts..."
sudo apt install fontconfig -y
curl https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip -o JetBrainsMono.zip
unzip JetBrainsMono.zip -d /usr/share/fonts/
rm JetBrainsMono.zip
fc-cache -f -v

## Install Starship
echo "  |--> Installing Starship..."
curl -fsSL https://starship.rs/install.sh | bash

## Edit .bashrc
echo "  |--> Editing .bashrc..."
echo 'eval "$(starship init bash)"' >> ~/.bashrc

## Download Starship config file
echo "  |--> Downloading Starship config file..."
mkdir -p ~/.config
curl https://raw.githubusercontent.com/Remag29/MyCustomShell/main/bash/starship.toml -o ~/.config/starship.toml