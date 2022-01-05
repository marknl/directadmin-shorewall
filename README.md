# directadmin-shorewall
Blocking IP's with shorewall via DirectAdmin

The scripts will use the default "dynamic" chain in iptables that shorewall uses by default when you manually add an IP.

## Installation
```bash
cd /usr/local/directadmin/scripts/custom
wget https://github.com/interwijs/directadmin-shorewall/releases/download/v1.0/directadmin-shorewall-1.0.zip
chmod 700 block_ip.sh show_blocked_ips.sh unblock_ip.sh
touch /root/blocked_ips.txt
touch /root/exempt_ips.txt
```

## Autoblock
When you're comfortable enabling autoblock
```bash
chmod 700 brute_force_notice_ip.sh
```

If you want to receive notifications about autoblocks, open the file brute_force_notice_ip.sh and set 
`NOFIY_BY_EMAIL` to 1 and change the `EMAIL` variable. Then safe the file.
``` bash
vi /usr/local/directadmin/scripts/custom/brute_force_notice_ip.sh
```
Now refresh your directadmin webpage and the 'Block IP' option will be enabled.

## Credits
Original scripts came from https://help.directadmin.com/item.php?id=380. I just edited them so they work seemlessly with shorewall.
