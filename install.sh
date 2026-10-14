#!/usr/bin/env bashExit immediately if a command exits with a non-zero statusset -eConfigurationDOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config"
BACKUP_DIR="$HOME/.config_backup_$(date +%Y%m%d_%H%M%S)"echo "--------------------------------------------------"
echo "🚀 Starting dotfiles installation from $DOTFILES_DIR"
echo "--------------------------------------------------"Ensure target config directory existsmkdir -p "$CONFIG_DIR"Config entries inside .config to processCONFIG_ITEMS=(
"hypr"
"kitty"
"micro"
"waybar"
"waypaper"
"wlogout"
"starship.toml"
)Function to safely create symlink with backuplink_item() {
local item="$1"
local src="$DOTFILES_DIR/.config/$item"
local dest="$CONFIG_DIR/$item"if [ ! -e "$src" ]; then
    echo "⚠️  Skipping: $src does not exist in repository."
    return
fi

# Handle existing directory or file at destination
if [ -e "$dest" ] \vert{}\vert{} [ -L "$dest" ]; then
    if [ -L "$dest" ] && [ "$(readlink -f "$dest")" == "$src" ]; then
        echo "✅ Already linked: $dest ->$src"
        return
    fi

    echo "📦 Backing up existing config: $dest"
    mkdir -p "$BACKUP_DIR"
    mv "$dest" "$BACKUP_DIR/"
fi

echo "🔗 Creating symlink: $dest ->$src"
ln -sfn "$src" "$dest"
}Run linking loopfor item in "${CONFIG_ITEMS[@]}"; do
link_item "$item"
doneecho "--------------------------------------------------"
echo "🎉 Dotfiles installation complete!"
if [ -d "$BACKUP_DIR" ]; then
echo "💾 Previous configs backed up to: $BACKUP_DIR"
fi
echo "--------------------------------------------------"
