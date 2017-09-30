#!/bin/sh

# This script can be used to ping a remote host or DNS server and verify
# whether a route to that host exists. It sends a total of 100 pings with an
# interval of 200 ms between pings. It requires one argument, the remote IP
# address or host name. It can be scheduled to execute periodically (e.g. every
# 10 minutes) to log ISP service interruptions. Example cron configuration:
#
# */10 * * * * /home/pi/ping-host.sh dns1.skybroadband.com >> /home/pi/output

if [ "$#" -ne 1 ]
then
    echo "Usage $0 <HOST>"
    exit 1
fi

NOW=`date +"%Y%m%d %T"`
PING_OUTPUT=`ping -c 100 -i 0.2 -q $1`

PACKETS=`echo "$PING_OUTPUT" | grep packets`
RTT=`echo "$PING_OUTPUT" | grep rtt`
echo $NOW - $PACKETS - $RTT
exit 0

