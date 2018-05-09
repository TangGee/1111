#!/system/bin/sh

if [ $1 = 'start' ]; then
	echo 'start network log ...'
	ret=`iptables -L | grep NetworkLog`
	if [ "$ret" != '' ] ; then
		iptables -D INPUT ! -i lo -j NetworkLog
		iptables -D OUTPUT ! -o lo -j NetworkLog
		iptables -F NetworkLog
		iptables -X NetworkLog
	fi
	iptables -N NetworkLog
	iptables -I OUTPUT ! -o lo -j NetworkLog
	iptables -I INPUT ! -i lo -j NetworkLog
	iptables -A NetworkLog -j NFLOG --nflog-prefix "{NL}" --nflog-group 13
	./nflog 13 > /sdcard/networklog.txt &
elif [ $1 = 'stop' ] ; then
	pid=`ps | grep nflog |  tr "\t" "  " | tr -s " " | cut -d ' ' -f 2`
        kill -s 9 $pid 
	iptables -D INPUT ! -i lo -j NetworkLog
        iptables -D OUTPUT ! -o lo -j NetworkLog
        iptables -F NetworkLog
        iptables -X NetworkLog
	echo 'stop network log ...'
else 
	echo 'usage: [start] to start log\n, [stop] stop log'
fi

