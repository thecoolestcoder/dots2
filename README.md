🛠️ Hyprland Dotfiles (dots2)

A sleek, minimal Arch Linux Hyprland workspace configuration using modern tools for a seamless desktop experience.

🧰 Included Configurations

Hyprland — Wayland compositor window manager settings.

Kitty — GPU-accelerated terminal emulator.

Micro — Intuitive terminal-based text editor.

Waybar — Highly customizable status bar for Wayland.

Waypaper — GUI wallpaper setter for Wayland.

Wlogout — Wayland logout menu.

Starship — Minimal, lightning-fast cross-shell prompt.

🚀 Quick Installation

Run the following interactive setup script in your terminal to automatically backup existing configs and symlink all files into ~/.config:

git clone https://github.com/thecoolestcoder/dots2.git ~/dots2
cd ~/dots2
chmod +x install.sh
./install.sh


📁 Repository Structure

dots2/
├── .config/
│   ├── hypr/
│   ├── kitty/
│   ├── micro/
│   ├── waybar/
│   ├── waypaper/
│   ├── wlogout/
│   └── starship.toml
├── install.sh
└── README.md


🔧 Manual Setup (Alternative)

If you prefer to set up symbolic links manually without the installation script:

# Create target config directory
mkdir -p ~/.config

# Create symlinks manually
ln -sfn ~/dots2/.config/hypr ~/.config/hypr
ln -sfn ~/dots2/.config/kitty ~/.config/kitty
ln -sfn ~/dots2/.config/micro ~/.config/micro
ln -sfn ~/dots2/.config/waybar ~/.config/waybar
ln -sfn ~/dots2/.config/waypaper ~/.config/waypaper
ln -sfn ~/dots2/.config/wlogout ~/.config/wlogout
ln -sfn ~/dots2/.config/starship.toml ~/.config/starship.toml
