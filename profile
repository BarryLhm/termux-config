#!/data/data/com.termux/files/usr/bin/bash -n
## home/.profile

	GetHitokoto()
{
	if ping -W 1 -c 1 -s 0 v1.hitokoto.cn >/dev/null 2>&1
	then curl https://v1.hitokoto.cn?encode=text 2>/dev/null; echo
	else echo '无法连接至一言'; fi
}

	ShowMotd()
{
	if [ $COLUMNS -ge 65 ]
	then cat << EOF
 ╭──────────────╮                                               │
 │  __          │ ╭───────╮  github.com/BarryLhm/termux-config  │
 │  ╲ ╲         │ ╰──╮ ╭──╯                                     │
 │   ╲ ╲        │    │ │ ╭────╮ ╭─┬──╮╭─┬─────╮ ╭─╮ ╭─╮ ╭────╮  │
 │   ╱ ╱ ____   │    │ │ │ ── │ │ ╭──╯│ ╭╮ ╭╮ │ │ │ │ │ │ ╲╱ │  │
 │  ╱_╱ │____│  │    │ │ │ ───┤ │ │   │ ││ ││ │ │ ╰─╯ │ │ ╱╲ │  │
 │              │    ╰─╯ ╰────╯ ╰─╯   ╰─╯╰─╯╰─╯ ╰───┴─╯ ╰────╯  │
 ╰──────────────╯  Type "xfce" to start xfce desktop.           │
────────────────────────────────────────────────────────────────╯
EOF
	else echo 'Welcome to Termux!'; repeat "$COLUMNS" '─'
	fi
}

ShowMotd
echo "PID: $$"
GetHitokoto
todo

