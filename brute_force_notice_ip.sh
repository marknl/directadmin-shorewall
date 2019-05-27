#!/bin/sh
#VERSION=1.0

# Set this value to 1 if you want notifications about auto blocked ip's
NOFIY_BY_EMAIL=0

# Where you want the email to be sent to
EMAIL=your@email.tld

# Give your server a name for easy idenfication 
SERVER=`hostname -s`

if [ "${NOFIY_BY_EMAIL}" -gt 0 ]; then
  echo "IP $value has been blocked for making $count failed login attempts
  $data
  `dig -x $value`" | mail -s "$SERVER:  blocked $value for $count failed attempts" $EMAIL
fi

SCRIPT=/usr/local/directadmin/scripts/custom/block_ip.sh
ip=$value $SCRIPT
exit $?;
