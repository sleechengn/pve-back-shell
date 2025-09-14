#!/usr/bin/bash
set -e

rm -rf $(dirname $0)/{etc,opt,usr,var}

if [ -e "/home" ] && [ "$(ls -A /home)" ]; then
	echo "存在/home，将删除老的/home备份"
	rm -rf $(dirname $0)/home
fi

if [ -e "/etc/modules" ]; then
	echo "01 备份 /etc/modules"
	mkdir -p $(dirname $0)/etc
	cp -ra /etc/modules $(dirname $0)/etc
else
	echo "01 未备份 /etc/modules"
fi

if [ -e "/etc/fstab" ]; then
	echo "02 备份 /etc/fstab"
	mkdir -p $(dirname $0)/etc
	cp -ra /etc/fstab $(dirname $0)/etc
else
	echo "02 未备份 /etc/fstab"
fi

if [ -e "/etc/rc.local" ]; then
	echo "03 备份 /etc/rc.local"
	mkdir -p $(dirname $0)/etc
	cp -ra /etc/rc.local $(dirname $0)/etc
else
	echo "03 未备份 /etc/rc.local"
fi

if [ -e "/etc/default/grub" ]; then
	echo "04 备份 /etc/default/grub"
	mkdir -p $(dirname $0)/etc/default
	cp -ra /etc/default/grub $(dirname $0)/etc/default
else
	echo "04 未备份 /etc/default/grub"
fi

if [ "$(ls -A /etc/modprobe.d)" ]; then
	echo "05 备份 /etc/modprobe.d/*"
	mkdir -p $(dirname $0)/etc/modprobe.d
	cp -ra /etc/modprobe.d/* $(dirname $0)/etc/modprobe.d
else
	echo "05 未备份 /etc/modprobe.d/*"
fi

if [ -e "/etc/network/interfaces" ]; then
	echo "06 备份 /etc/network/interfaces"
	mkdir -p $(dirname $0)/etc/network
	cp -ra /etc/network/interfaces $(dirname $0)/etc/network
else
	echo "06 未备份 /etc/network/interfaces"
fi

if [ "$(ls -A /etc/systemd/network)" ]; then
	echo "07 备份 /etc/systemd/network/*"
	mkdir -p $(dirname $0)/etc/systemd/network
	cp -ra /etc/systemd/network/* $(dirname $0)/etc/systemd/network
else
	echo "07 未备份 /etc/systemd/network/*"
fi

if [ "$(ls -A /opt)" ]; then
	echo "08 备份 /opt/*"
	mkdir -p $(dirname $0)/opt
	cp -ra /opt/* $(dirname $0)/opt
else
	echo "08 未备份 /opt/*"
fi

if [ "$(ls -A /etc/pve/qemu-server)" ]; then
	echo "09 备份 /etc/pve/qemu-server/*"
	mkdir -p $(dirname $0)/etc/pve/qemu-server
	cp -ra /etc/pve/qemu-server/* $(dirname $0)/etc/pve/qemu-server
else
	echo "09 未备份 /etc/pve/qemu-server/*"
fi

if [ -e "/usr/share/kvm/vbios" ]; then
	if [ "$(ls -A /usr/share/kvm/vbios)" ]; then
		echo "10 备份 /usr/share/kvm/vbios/*"
		mkdir -p $(dirname $0)/usr/share/kvm/vbios
		cp -ra /usr/share/kvm/vbios/* $(dirname $0)/usr/share/kvm/vbios
	else
		echo "10 未备份 /usr/share/kvm/vbios/*"
	fi
	else "10 未备份 /usr/share/kvm/vbios/*"
fi

if [ -e "/etc/pve/lxc" ]; then
	if [ "$(ls -A /etc/pve/lxc)" ]; then
		echo "11 备份 /etc/pve/lxc/*"
		mkdir -p $(dirname $0)/etc/pve/lxc
		cp -ra /etc/pve/lxc/* $(dirname $0)/etc/pve/lxc
	else
		echo "11 未备份 /etc/pve/lxc/*"
	fi
else
	echo "11 未备份 /etc/pve/lxc/*"
fi

if [ -e "/home/sa/appShell" ]; then
	if [ "$(ls -A /home/sa/appShell)" ]; then
		echo "12 备份 /home/sa/appShell/*"
		mkdir -p $(dirname $0)/home/sa/appShell
		cp -ra /home/sa/appShell/* $(dirname $0)/home/sa/appShell
	else
		echo "12 未备份 /home/sa/appShell/*"
	fi
else
	echo "12 未备份 /home/sa/appShell/*"
fi

if [ -e "/home/sa/appImages" ]; then
	if [ "$(ls -A /home/sa/appImages)" ]; then
		echo "13 备份 /home/sa/appImages/*"
		mkdir -p $(dirname $0)/home/sa/appImages
		cp -ra /home/sa/appImages/* $(dirname $0)/home/sa/appImages
	else
		echo "13 未备份 /home/sa/appImages/*"
	fi
else
	echo "13 未备份 /home/sa/appImages/*"
fi

if [ -e "/etc/pve/mapping" ]; then
	if [ "$(ls -A /etc/pve/mapping)" ]; then
		echo "14 备份 /etc/pve/mapping/*"
		mkdir -p $(dirname $0)/etc/pve/mapping
		cp -ra /etc/pve/mapping/* $(dirname $0)/etc/pve/mapping
	else
		echo "14 未备份 /etc/pve/mapping/*"
	fi
else
	echo "14 未备份 /etc/pve/mapping/*"
fi

if [ -e "/etc/pve/storage.cfg" ]; then
	echo "15 备份 /etc/pve/storage.cfg"
	mkdir -p $(dirname $0)/etc/pve
	cp -ra /etc/pve/storage.cfg $(dirname $0)/etc/pve
else
	echo "15 未备份 /etc/pve/storage.cfg"
fi

if [ -e "/home/sa/Desktop" ]; then
	if [ "$(ls -A /home/sa/Desktop)" ]; then
		echo "16 备份 /home/sa/Desktop/*"
		mkdir -p $(dirname $0)/home/sa/Desktop
		cp -ra /home/sa/Desktop/* $(dirname $0)/home/sa/Desktop
	else
		echo "16 未备份 /home/sa/Desktop/*"
	fi
else
	echo "16 未备份 /home/sa/Desktop/*"
fi

if [ -e "/home/sa/.tmux.conf" ]; then
	mkdir -p $(dirname $0)/home/sa
	cp -a /home/sa/.tmux.conf $(dirname $0)/home/sa
	echo "16.1 已备份/home/sa/.tmux.conf"
else
	echo "16.1 未备份/home/sa/.tmux.conf"
fi

if [ -e "/home/sa/桌面" ]; then
	if [ "$(ls -A /home/sa/桌面)" ]; then
		echo "17 备份 /home/sa/桌面/*"
		mkdir -p $(dirname $0)/home/sa/桌面
		cp -ra /home/sa/桌面/*	$(dirname $0)/home/sa/桌面
	else
		echo "17 未备份 /home/sa/桌面/*"
	fi
else
	echo "17 未备份 /home/sa/桌面/*"
fi

if [ -e "/var/lib/vz/snippets" ]; then
	if [ "$(ls -A /var/lib/vz/snippets)" ]; then
		echo "18 备份 /var/lib/vz/snippets/*"
		mkdir -p $(dirname $0)/var/lib/vz/snippets
		cp -ra /var/lib/vz/snippets/* $(dirname $0)/var/lib/vz/snippets
	else
		echo "18 未备份 /var/lib/vz/snippets/*"
	fi
else
	echo "18 未备份 /var/lib/vz/snippets/*"
fi

if [ -e "/etc/systemd/system/ttyd.service" ]; then
	echo "19 备份 /etc/systemd/system/ttyd.service"
	mkdir -p $(dirname $0)/etc/systemd/system
	cp /etc/systemd/system/ttyd.service $(dirname $0)/etc/systemd/system
else
	echo "19 未备份 /etc/systemd/system/ttyd.service"
fi

if [ -e "/etc/systemd/system/comfyui-models.service" ]; then
	echo "20 备份 /etc/systemd/system/comfyui-models.service"
	mkdir -p $(dirname $0)/etc/systemd/system
	cp /etc/systemd/system/comfyui-models.service $(dirname $0)/etc/systemd/system
else
	echo "20 未备份 /etc/systemd/system/comfyui-models.service"
fi

if [ -e "/usr/bin/ttyd.x86_64" ]; then
	echo "21 备份 /sur/bin/ttyd.x86_64"
	mkdir -p $(dirname $0)/usr/bin
	cp /usr/bin/ttyd.x86_64 $(dirname $0)/usr/bin
else
	echo "21 未备份 /sur/bin/ttyd.x86_64"
fi

if [ -e "/etc/hostname" ]; then
	echo "22 备份 /etc/hostname"
	mkdir -p $(dirname $0)/etc
	cp -ra /etc/hostname $(dirname $0)/etc
else
	echo "22 未备份 /etc/hostname"
fi

if [ -e "/etc/hosts" ]; then
	echo "23 备份 /etc/hosts"
	mkdir -p $(dirname $0)/etc
	cp -ra /etc/hosts $(dirname $0)/etc
else
	echo "23 未备份 /etc/hosts"
fi

if [ -e "/etc/pve/nodes" ]; then
	echo "24 备份 /etc/pve/nodes"
	mkdir -p $(dirname $0)/etc/pve
	cp -ra /etc/pve/nodes $(dirname $0)/etc/pve
else
	echo "24 未备份 /etc/pve/nodes"
fi

if [ -e "/etc/systemd/system/autostart.service" ]; then
        echo "25 备份 /etc/systemd/system/autostart.service"
        mkdir -p $(dirname $0)/etc/systemd/system
        cp -ra /etc/systemd/system/autostart.service $(dirname $0)/etc/systemd/system
else
        echo "25 未备份 /etc/systemd/system/autostart.service"
fi

if [ -e "/etc/pve/datacenter.cfg" ]; then
	mkdir -p $(dirname $0)/etc/pve
	cp -ra /etc/pve/datacenter.cfg $(dirname $0)/etc/pve
	echo "26 已备份 /etc/pve/datacenter.cfg"
else
	echo "26 未备份 /etc/pve/datacenter.cfg"
fi


echo "注意还原以后有的需要修改，比如fstab"
