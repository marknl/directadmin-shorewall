#!/bin/sh
#VERSION=1.0

BF=/root/blocked_ips.txt

# This is the default chain where shorewall puts it's manual entries
BLOCK_CHAIN=dynamic

if [ "$ip" = "" ]; then
        echo "Usage:";
        echo "  $0 1.2.3.4";
        exit 1;
fi

if [ ! -e "$BF" ]; then
        echo "cannot find $BF to unblock the IP";
        exit 2;
fi

COUNT=`grep -c "^$ip=" $BF`;

if [ "$COUNT" -eq 0 ]; then
        echo "$1 was not in $BF. Not unblocking";
        exit 2;
fi

#unblock.
echo "Unblocking $ip ...";

cat $BF | grep -v "^$ip=" > $BF.temp
mv $BF.temp $BF
chmod 600 $BF
shorewall allow $ip
exit 0;
