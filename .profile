#!/data/data/com.termux/files/usr/bin/bash
## home/.profile

termux-wake-lock

	GetHitokoto()
{
	if [ 'ping -W 1 -c 1 -s 0 v1.hitokoto.cn >/dev/null 2>&1' ]
	then curl https://v1.hitokoto.cn?encode=text 2>/dev/null; echo
	else echo '无法连接至一言'; fi
}

echo "PID: $$"
GetHitokoto
todo

