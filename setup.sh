cd ~
sudo pacman -Syu

sudo pacman -S --noconfirm --needed git base-devel && mkdir ~/Repos && cd ~/Repos && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
sudo pacman -S --noconfirm stow

cd ~/dotfiles
stow .

sudo pacman -S --noconfirm librewolf-bin neovim hyprland bluez bluez-utils blueman github-cli kitty tidal-hifi-bin ranger neofetch rust go nvm zsh

sudo systemctl enable bluetooth.service
nvm install-latest-npm

cd ~/Repos
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git

sudo pacman -S --noconfirm zsh-syntax-highlighting zsh-theme-powerlevel10k-git

Hyprland
