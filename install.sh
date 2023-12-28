#!/data/data/com.termux/files/usr/bin/bash -n
rootDir=/data/data/com.termux/files
sourceDir="$(dirname "$0")"

	LinkFiles()
{
	ln -sf .termux/bashrc ~/.bashrc
	ln -sf .termux/profile ~/.profile
}

if [ x"$(realpath "$(dirname "$0")")" = x"$rootDir"/home/.termux ] 
then LinkFiles
else echo Please move "$sourceDir" to '~'/.termux !
fi

