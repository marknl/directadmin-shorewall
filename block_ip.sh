#!/bin/sh
#VERSION=1.0

BF=/root/blocked_ips.txt
EF=/root/exempt_ips.txt

# This is the default chain where shorewall puts it's manual entries
BLOCK_CHAIN=dynamic

curriptables()
{
	echo "<br><br><textarea cols=160 rows=60>";
	shorewall show dynamic
	echo "</textarea>";
}

if [ "$ip" = "" ]; then
        echo "No ip has been passed via env.";
        exit 1;
fi

### Do we have a block file?
if [ ! -e "$BF" ]; then
	echo "Cannot find $BF";
	exit 1;
fi

### Do we have an exempt file?
if [ ! -e "$EF" ]; then
        echo "Cannot find $EF";
        exit 1;
fi

### Make sure it's not exempt
COUNT=`grep -c "^${ip}\$" $EF`;
if [ "$COUNT" -ne 0 ]; then
        echo "$ip in the exempt list ($EF). Not blocking.";
        curriptables
        exit 2;
fi

### Make sure it's not alreaday blocked
COUNT=`grep -c "^${ip}=" $BF`;
if [ "$COUNT" -ne 0 ]; then
	echo "$ip already exists in $BF ($COUNT). Not blocking.";
	curriptables
	exit 2;
fi

echo "Blocking $ip ...<br>";
echo "$ip=dateblocked=`date +%s`" >> $BF;
echo "Adding $ip into ${BLOCK_CHAIN} chain...";
shorewall drop $ip
echo "<br><br>Result:";
curriptables

exit 0;
