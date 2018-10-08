#!/usr/bin/python3

from netifaces import AF_INET
import netifaces as ni
import ipaddress

def getifnetcidr():

    gws = ni.gateways()
    ifname = gws['default'][ni.AF_INET][1]

    ipaddr = ni.ifaddresses(ifname)[AF_INET][0]['addr']
    netmask = ni.ifaddresses(ifname)[AF_INET][0]['netmask']
    netwithmask = [ipaddr,netmask]
    network = '/'.join(netwithmask)
    netcidr = ipaddress.ip_network(network, strict=False)
    print(netcidr)

getifnetcidr()
