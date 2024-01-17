#!/data/data/com.termux/files/usr/bin/bash -n
## home/.bashrc

PS1=' \[\e[1;36m\]\w $(if [ $? == 0 ];then echo \[\e[1\;32m\];else echo \[\e[1\;31m\]"($?)";fi)\$\[\e[m\] '
PS2='> '
PATH="$PATH"':/data/data/com.termux/files/home/.local/bin'
DISPLAY=':0'

alias l='ls -lAh'

	MountTemp()
{
	local tempDir owner group
	tempDir='/data/data/com.termux/files/usr/temp'
	owner="$(id -u)"
	group="$(id -g)"
	sudo mountpoint "$tempDir" && return 0
	sudo mount -t tmpfs -o mode=700,uid="$owner",gid="$group" tmpfs "$tempDir"
}

	repeat()
{
	local v; v="$(printf %-"$1"s)";echo "${v// /"$2"}"
}

	todo()
{
	cat << EOF
╔═════╗
║Todo:╟$(repeat "$(( "$COLUMNS" - 7 ))" '─')
╚═════╝
$(cat ~/.termux/todo)
$(repeat "$COLUMNS" '─')
EOF
}


	StartProot()
{
	local rootfs="$1"
	unset LD_PRELOAD
	proot -0 -r "$rootfs" -b /dev -b /proc -b /sys -b "$1"/root:/dev/shm -b /sdcard -b /data/data/com.termux/files/home -w /root /usr/bin/env -i HOME=/root TERM="$TERM" LANG=zh_CN.UTF8 PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:~/.local/bin:. "$@"
}

	twl()
{
	termux-wake-lock
}

	nh()
{
	if [ $# = 0 ]; then StartKali; else StartKali -c "$@"; fi
}

	x11()
{
	export DISPLAY=:0
	am start com.termux.x11/com.termux.x11.MainActivity
	termux-x11 &
}

	xfce()
{
	x11 & startxfce4
}

alias mt='cfm'

