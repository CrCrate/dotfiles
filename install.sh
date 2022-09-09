#!/bin/sh

echo RUN AS ROOT
echo script assumes youre running archinstall arch with desktop i3-gaps profile
echo starting install

echo installing utils
pacman -Sy --noconfirm git kitty ark rofi dunst zsh polkit-gnome

echo using zsh as users shell
usermod --shell /bin/zsh $USER

echo installing yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg
mv pkg/yay /bin/yay
cd ..

echo installing more utils
yay -S --noconfirm polybar zsh-theme-powerlevel10k-git

echo installing wine and deps
pacman -S --noconfirm wine-staging winetricks
pacman -S --noconfirm giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo libxcomposite lib32-libxcomposite libxinerama lib32-libxinerama ncurses lib32-ncurses opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader cups samba dosbox

echo installing heroic launcher
yay -S --noconfirm heroic-games-launcher-bin

echo installing steam
pacman -S --noconfirm steam

echo installing configs
git clone https://github.com/crcrate/dotfiles
cd dotfiles
# theres probably a better way to select all folders than specifying each one
rsync --remove-source-files dunst gtk-3.0 i3 kitty polybar rofi /home/$USER/.config
mv .zshrc /home/$USER/.zshrc
#TODO INSTALL GTK THEME FROM PLING



echo done \(ish\)

