#!/bin/bash

WAN_ADAPT_NAME=$1
EXT_ADAPT_NAME=$2
EXT_ADAPT_ADDR=$3
INT_ADAPT_NAME=$4
INT_ADAPT_ADDR=$5

echo 1 > /proc/sys/net/ipv4/ip_forward

# Tell IP Tables to masquerade traffic leaving the system from inside the namespace.
iptables -t nat -C POSTROUTING -s "${INT_ADAPT_ADDR}"/24 -o "${WAN_ADAPT_NAME}" -j MASQUERADE || iptables -t nat -A POSTROUTING -s "${INT_ADAPT_ADDR}"/24 -o "${WAN_ADAPT_NAME}" -j MASQUERADE

# Tell IP Tables to accept (and forward? I'm not well versed in IP Tables) connections between the internet and the external adapter for our namespace
iptables -C FORWARD -i "${WAN_ADAPT_NAME}" -o "${EXT_ADAPT_NAME}" -j ACCEPT || iptables -A FORWARD -i "${WAN_ADAPT_NAME}" -o "${EXT_ADAPT_NAME}" -j ACCEPT
iptables -C FORWARD -o "${WAN_ADAPT_NAME}" -i "${EXT_ADAPT_NAME}" -j ACCEPT || iptables -A FORWARD -o "${WAN_ADAPT_NAME}" -i "${EXT_ADAPT_NAME}" -j ACCEPT
