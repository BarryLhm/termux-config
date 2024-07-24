#!/data/data/com.termux/files/usr/bin/bash -eu

termuxRoot='/data/data/com.termux/files'
sourceDir="$(realpath "$(dirname "$0")")"

LinkFiles()
{
	ln -sf '.termux/bashrc' "$HOME"'/.bashrc'
	ln -sf '.termux/profile' "$HOME"'/.profile'
}

RemoveMOTD()
{
	local motdFile="$termuxRoot"'/usr/etc/motd'
	mv "$motdFile" "$motdFile"'~'
}
if [ "$sourceDir" == "$termuxRoot"'/home/.termux' ] 
then LinkFiles
else echo 'Please move '"$sourceDir"' to ~/.termux !'
fi
RemoveMOTD
