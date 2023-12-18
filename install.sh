#!/data/data/com.termux/files/usr/bin/bash
sourceDir=$(dirname "$0")
cp "$sourceDir" "~/.termux"
rm "~/.termux/install.sh"
rm "~/.termux/backup.sh"
rn -r "~/.termux/.git"
ln -s "../../home/.termux/motd" "~/../usr/etc/motd"

