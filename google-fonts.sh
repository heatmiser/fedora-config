#!/bin/sh

. ./common.sh
srcdir="$HOME/google-fonts"
echo Installing Font Manager

sudo $INSTALLER install -y \
    font-manager
# For system-wide fonts
#pkgdir="/usr/share/fonts/truetype/google-fonts"
# For current user only fonts
pkgdir="$HOME/.fonts"
giturl="git://github.com/google/fonts.git"

mkdir $srcdir
cd $srcdir
echo "Cloning Git repository..."
git clone $giturl

echo "Pulling out font files only..."
cd $srcdir/fonts
find . -type f -name "*.ttf" -exec tar -rvf ttf_files.tar {} \;

echo "Installing fonts in $pkgdir ..."
mkdir -p $pkgdir
cd $pkgdir
tar xvf $srcdir/fonts/ttf_files.tar
chmod -R u+x *
find . -name '.uuid' | xargs rm

echo "Updating font-cache..."
fc-cache -f > /dev/null

echo "Clean up..."
rm -rf $srcdir

echo "Done!"
