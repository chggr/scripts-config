#!/bin/sh

# This script calls iptables-restore to restore a dump of firewall rules into
# iptables. It is normally placed under /etc/network/if-pre-up.d so that it is
# executed automatically right after boot but before the network interfaces are
# brought up.

iptables-restore < ./iptables.rules
exit 0

