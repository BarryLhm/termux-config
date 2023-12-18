#!/data/data/com.termux/files/usr/bin/bash
backupDir="~/termux-backup_$(date +%y%m%d_%H%M)"
echo "Backup directory is $backupDir"
mv "~/../usr/etc/motd" "$backupDir/motd"
mv "~/.termux" "$backupDir/.termux"
mv "~/.profile" "$backupDir/.profile"
mv "~/.bashrc" "backupDir/.bashrc"
echo "Backup done"

