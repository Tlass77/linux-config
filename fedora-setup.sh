!#/bin/sh
echo "~~~~~~~~~~~"
echo "Fedora 36 first time configuration. Last tested: July 11 2022"
echo "~~~~~~~~~~~"

# System
## Install apps
### Debloat

#System update

sudo dnf update -y
sudo dnf clean all
echo "Dnf update complete"

# Enable RPM Fusion
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
echo "RPM Fusion enabled"
sudo dnf groupdate core

#Enable Flathub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
echo "Flatpack enabled"


#Ffmpeg
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf install ffmpeg -y
echo "Ffmpeg installed"

#Media codecs
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y
sudo dnf groupupdate sound-and-video -y
sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel -y
echo "Media codecs installed"

##LibreWolf
sudo rpm --import https://keys.openpgp.org/vks/v1/by-fingerprint/034F7776EF5E0C613D2F7934D29FBD5F93C0CFC3
sudo dnf config-manager --add-repo https://rpm.librewolf.net -y
sudo dnf install --refresh librewolf -y

## LaTeX Setup 4.0 GB
sudo dnf makecache --refresh
sudo dnf install texlive-scheme full -y
sudo dnf install texmaker -y
echo "TeX installed"

## R and RStudio
sudo dnf install R -y
echo "R installed"

## Pip update
python -m ensurepip --upgrade

echo "~~~~~~~~~~~ First time config complete ~~~~~~~~~~~"



