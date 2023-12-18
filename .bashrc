#!/data/data/com.termux/files/usr/bin/bash
## home/.bashrc

PS1='\[\e[1;36m\]\w $(if [ $? == 0 ];then echo \[\e[1\;32m\];else echo \[\e[1\;31m\]"($?)";fi)\$\[\e[m\] '
PS2=''
PATH="$PATH":/data/data/com.termux/files/home/.local/bin
alias l='ls -lAh'

	setmode()
{
  if [ $# = 1 ]; then printf "$1">"$termux_mode_profile"
  else echo 'Usage: setmode kali|disabled|""(default)'; fi
}

	StartKali()
{
unset LD_PRELOAD
proot -l -0 -r /data/data/com.termux/files/home/kali-arm64 -b /dev -b /proc -b /data/data/com.termux/files/home/kali-arm64/root:/dev/shm -b /sdcard -b /data/data/com.termux/files/home -w /root /usr/bin/env -i HOME=/root TERM="$TERM" LANG=zh_CN.UTF8 PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:~/.local/bin:. /bin/bash --login "$@"
}

	nh()
{
  if [ $# = 0 ]; then StartKali; else StartKali -c "$@"; fi
}

	xfce()
{
	termux-x11 & export DISPLAY=:0
	am start com.termux.x11/com.termux.x11.MainActivity
	sleep 1; startxfce4
}

alias mt='cfm'

