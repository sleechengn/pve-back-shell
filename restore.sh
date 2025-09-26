#!/usr/bin/bash
set -e

if [ -e "$(dirname $0)/etc/fstab" ]; then
	echo "01 还原/etc/fstab"
	cp -ra $(dirname $0)/etc/fstab /etc
fi

if [ -e "$(dirname $0)/etc/modules" ]; then
	echo "02 还原/etc/modules"
	cp -ra $(dirname $0)/etc/modules /etc
	update-initramfs -u -k all
fi

if [ -e "$(dirname $0)/etc/default/grub" ]; then
	echo "03 还原/etc/default/grub"
	cp -ra $(dirname $0)/etc/default/grub /etc/default/
	update-grub
fi

if [ -e "$(dirname $0)/etc/rc.local" ]; then
	echo "04 还原/etc/rc.local"
	cp -ra $(dirname $0)/etc/rc.local /etc
	chmod +x /etc/rc.local
	systemctl enable rc-local
	echo "不要忘记装hd-idle"
fi

if [ "$(ls -A $(dirname $0)/etc/modprobe.d)" ]; then
	echo "05 还源/etc/modprobe.d/*"
	cp -ra $(dirname $0)/etc/modprobe.d/* /etc/modprobe.d
	update-initramfs -u -k all
fi

if [ -e "$(dirname $0)/etc/network/interfaces" ]; then
	echo "06 还原/etc/network/interfaces"
	cp -ra $(dirname $0)/etc/network/interfaces /etc/network
fi

if [ "$(ls -A $(dirname $0)/etc/systemd/network)" ]; then
	echo "07 还原/etc/systemd/network/*"
	cp -ra $(dirname $0)/etc/systemd/network/* /etc/systemd/network
fi

if [ "$(ls -A $(dirname $0)/opt)" ]; then
	echo "08 还原/opt/*"
	cp -ra $(dirname $0)/opt/* /opt
fi

if [ "$(ls -A $(dirname $0)/etc/pve/qemu-server)" ]; then
	echo "09 还原/etc/pve/qemu-server/*"
	rm -rf /etc/pve/qemu-server/*
	cp -ra $(dirname $0)/etc/pve/qemu-server/* /etc/pve/qemu-server
fi

if [ -e "$(dirname $0)/usr/share/kvm/vbios" ]; then
	echo "10 还原/usr/share/kvm/vbios/*"
	cp -ra $(dirname $0)/usr/share/kvm/vbios /usr/share/kvm
fi

if [ "$(ls -A $(dirname $0)/etc/pve/lxc)" ]; then
	echo "11 还原/etc/pve/lxc/*"
	if [ -e "/etc/pve/lxc" ]; then
		cp -ra $(dirname $0)/etc/pve/lxc/* /etc/pve/lxc
	fi
fi

if [ "$(ls -A  $(dirname $0)/etc/pve/mapping)" ]; then
	echo "12 还原/etc/pve/mapping/*"
	if [ -e "/etc/pve/mapping" ]; then
		cp -ra $(dirname $0)/etc/pve/mapping/* /etc/pve/mapping
	fi
fi

if [ -e "$(dirname $0)/etc/pve/storage.cfg" ]; then
	echo "13 还原/etc/pve/storage.cfg"
	if [ -e "/etc/pve" ]; then
	    cp -ra $(dirname $0)/etc/pve/storage.cfg /etc/pve
	fi
fi

if [ -e "$(dirname $0)/var/lib/vz/snippets" ]; then
	echo "14 还原/var/lib/vz/snippets"
	cp -ra $(dirname $0)/var/lib/vz/snippets /var/lib/vz
fi

if [ -e "$(dirname $0)/etc/systemd/system/comfyui-models.service" ]; then
	echo "15 还原/etc/systemd/system/comfyui-models.service"
	cp -ra $(dirname $0)/etc/systemd/system/comfyui-models.service /etc/systemd/system
	systemctl enable comfyui-models
fi

if [ -e "$(dirname $0)/usr/bin/ttyd.x86_64" ]; then
	echo "16 还原/usr/bin/ttyd.x86_64"
	rm -rf /usr/bin/ttyd.x86_64
	cp -ra $(dirname $0)/usr/bin/ttyd.x86_64 /usr/bin
fi

if [ -e "$(dirname $0)/etc/nginx" ]; then
	cp -ra $(dirname $0)/etc/nginx /etc
	echo "16.2 还原/etc/nginx"
fi

if [ -e "$(dirname $0)/etc/systemd/system/ttyd.service" ]; then
	echo "17 还原/etc/systemd/system/ttyd.service"
        cp -ra $(dirname $0)/etc/systemd/system/ttyd.service /etc/systemd/system
        systemctl enable ttyd
fi

if [ -e "$(dirname $0)/home/sa" ]; then
	if [ ! -e "/home/sa" ]; then
		useradd -m --uid 100000 sa
	fi
fi

if [ -e "$(dirname $0)/home/sa/桌面" ] && [ -e "/home/sa" ]; then
	echo "18 还原/home/sa/桌面"
	rm -rf /home/sa/桌面
	cp -ra $(dirname $0)/home/sa/桌面 /home/sa
	chown -R sa:users /home/sa/桌面
fi

if [ -e "$(dirname $0)/home/sa/Desktop" ] && [ -e "/home/sa" ]; then
	echo "19 还原/home/sa/Desktop"
	rm -rf /home/sa/Desktop
	cp -ra $(dirname $0)/home/sa/Desktop /home/sa
	chown -R sa:users /home/sa/Desktop
fi

if [ -e "$(dirname $0)/home/sa/appImages" ] && [ -e "/home/sa" ]; then
	echo "19.1 还源/home/sa/appImages"
	rm -rf /home/sa/appImages
	cp -ra $(dirname $0)/home/sa/appImages /home/sa
	chown -R sa:users /home/sa/appImages
fi

if [ -e "$(dirname $0)/home/sa/appShell" ] && [ -e "/home/sa" ]; then
        echo "19.1 还源/home/sa/appShell"
	rm -rf /home/sa/appShell
        cp -ra $(dirname $0)/home/sa/appShell /home/sa
        chown -R sa:users /home/sa/appShell
fi

if [ -e "$(dirname $0)/home/sa/.tmux.conf" ] && [ -e "/home/sa" ]; then
	echo "19.3 还原/home/sa/.tmux.conf"
	cp -ra $(dirname $0)/home/sa/.tmux.conf /home/sa
	chown -R sa:users /home/sa/.tmux*
fi

if [ -e "$(dirname $0)/etc/systemd/system/autostart.service" ]; then
        echo "20 还原/etc/systemd/system/autostart.service"
        cp -ra $(dirname $0)/etc/systemd/system/autostart.service /etc/systemd/system
        systemctl enable autostart.service
fi

if [ -e "$(dirname $0)/etc/pve/datacenter.cfg" ]; then
	echo "21 还原 /etc/pve/datacenter.cfg"
	cp -ra $(dirname $0)/etc/pve/datacenter.cfg /etc/pve
fi

if [ -e "$(dirname $0)/etc/systemd/system/fifo.service" ]; then
	echo "22 还原/etc/systemd/system/fifo.service"
	cp -ra $(dirname $0)/etc/systemd/system/fifo.service /etc/systemd/system
	systemctl enable fifo
fi

$(dirname $0)/nodes.sh

echo "注意还原以后有的需要修改，比如fstab，然后重启"
