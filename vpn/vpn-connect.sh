#! /bin/bash

# This script connects to a given VPN service using openVPN. nohup is used to
# ensure the connection will not be abruptly terminated upon console exit. The
# following files are required to make the connection:
#
# 1) openVPN config file (.ovpn) which is normally provided by the VPN service.
# 2) login.cfg file that contains the username and password to use.

sudo nohup openvpn --config ./config.ovpn --auth-user-pass ./login.cfg > ./openvpn.out &

