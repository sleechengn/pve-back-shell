#!/usr/bin/bash
if [ -d "$(dirname $0)/etc/pve/nodes" ] && [ "$(ls -A $(dirname $0)/etc/pve/nodes)" ]; then
        for dn in $(ls -A $(dirname $0)/etc/pve/nodes)
	do
		if [ -d "/etc/pve/nodes/$dn" ]; then
			echo "准备还原：/etc/pve/nodes/$dn"
			cp -ra $(dirname $0)/etc/pve/nodes/$dn/pveproxy-ssl.key /etc/pve/nodes/$dn
			echo "已还原 $(dirname $0)/etc/pve/nodes/$dn/pveproxy-ssl.key"
			cp -ra $(dirname $0)/etc/pve/nodes/$dn/pveproxy-ssl.pem /etc/pve/nodes/$dn
			echo "已还原 $(dirname $0)/etc/pve/nodes/$dn/pveproxy-ssl.pem"
		fi
        done
fi
