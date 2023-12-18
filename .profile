#!/data/data/com.termux/files/usr/bin/bash
## home/.profile

termux-wake-lock
	GetHitokoto()
{
  if [ 'ping -c 1 v1.hitokoto.cn' ]; then echo $(curl https://v1.hitokoto.cn?encode=text 2>/dev/null);
  elif [ 'ping -c 1 www.example.com' ]; then echo '无法连接至一言';
  else echo '网络已断开'; fi
}

	StartKali()
{
  unset LD_PRELOAD
  proot -l -0 -r /data/data/com.termux/files/home/kali-arm64 -b /dev -b /proc -b /data/data/com.termux/files/home/kali-arm64/root:/dev/shm -b /sdcard -b /data/data/com.termux/files/home -w /root /usr/bin/env -i HOME=/root TERM="$TERM" LANG=zh_CN.UTF8 PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:~/.local/bin:. /bin/bash --login "$@"
}
termuxModeProfile='/sdcard/Android/termux_mode'
echo "PID: $$"
GetHitokoto;

	LoadTermuxMode()
{
  case "$1" in \
  kali) echo 'Termux 当前为 Kali 模式'; if [ 'StartKali -c exit' ]; then StartKali; else echo '未找到 Kali'; fi;; \
  disabled) echo 'Termux 已被禁用'; exec sleep 5;; *) echo '未知 Termux 模式, 正常启动'; esac
}

if [ -f "$termuxModeProfile" ]; then LoadTermuxMode $(cat "$termuxModeProfile"); else echo 'Termux 模式未设定, 正常启动'; fi

