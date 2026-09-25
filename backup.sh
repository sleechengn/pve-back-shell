#!/usr/bin/env bash
set -e

if [ -e "/etc/pve" ]; then

rm -rf $(dirname $0)/{etc,opt,usr,var,root}

if [ -e "/home" ] && [ "$(ls -A /home)" ]; then
	echo "exist /home do /home backup"
	rm -rf $(dirname $0)/home
fi

if [ -e "/etc/modules" ]; then
	echo "01 backup /etc/modules"
	mkdir -p $(dirname $0)/etc
	cp -ra /etc/modules $(dirname $0)/etc
else
	echo "01 undo /etc/modules"
fi

if [ -e "/etc/fstab" ]; then
	echo "02 backup /etc/fstab"
	mkdir -p $(dirname $0)/etc
	cp -ra /etc/fstab $(dirname $0)/etc
else
	echo "02 undo /etc/fstab"
fi

if [ -e "/etc/rc.local" ]; then
	echo "03 backup /etc/rc.local"
	mkdir -p $(dirname $0)/etc
	cp -ra /etc/rc.local $(dirname $0)/etc
else
	echo "03 undo /etc/rc.local"
fi

if [ -e "/etc/default/grub" ]; then
	echo "04 backup /etc/default/grub"
	mkdir -p $(dirname $0)/etc/default
	cp -ra /etc/default/grub $(dirname $0)/etc/default
else
	echo "04 undo /etc/default/grub"
fi

if [ "$(ls -A /etc/modprobe.d)" ]; then
	echo "05 backup /etc/modprobe.d/*"
	mkdir -p $(dirname $0)/etc/modprobe.d
	cp -ra /etc/modprobe.d/* $(dirname $0)/etc/modprobe.d
else
	echo "05 undo /etc/modprobe.d/*"
fi

if [ -e "/etc/network/interfaces" ]; then
	echo "06 backup /etc/network/interfaces"
	mkdir -p $(dirname $0)/etc/network
	cp -ra /etc/network/interfaces $(dirname $0)/etc/network
else
	echo "06 undo /etc/network/interfaces"
fi

if [ "$(ls -A /etc/systemd/network)" ]; then
	echo "07 backup /etc/systemd/network/*"
	mkdir -p $(dirname $0)/etc/systemd/network
	cp -ra /etc/systemd/network/* $(dirname $0)/etc/systemd/network
else
	echo "07 undo /etc/systemd/network/*"
fi

if [ "$(ls -A /opt)" ]; then
	echo "08 backup /opt/*"
	mkdir -p $(dirname $0)/opt
	cp -ra /opt/* $(dirname $0)/opt
else
	echo "08 undo /opt/*"
fi

if [ "$(ls -A /etc/pve/qemu-server)" ]; then
	echo "09 backup /etc/pve/qemu-server/*"
	mkdir -p $(dirname $0)/etc/pve/qemu-server
	cp -ra /etc/pve/qemu-server/* $(dirname $0)/etc/pve/qemu-server
else
	echo "09 undo /etc/pve/qemu-server/*"
fi

if [ -e "/usr/share/kvm/vbios" ]; then
	if [ "$(ls -A /usr/share/kvm/vbios)" ]; then
		echo "10 backup /usr/share/kvm/vbios/*"
		mkdir -p $(dirname $0)/usr/share/kvm/vbios
		cp -ra /usr/share/kvm/vbios/* $(dirname $0)/usr/share/kvm/vbios
	else
		echo "10 undo /usr/share/kvm/vbios/*"
	fi
	else "10 undo /usr/share/kvm/vbios/*"
fi

if [ -e "/etc/pve/lxc" ]; then
	if [ "$(ls -A /etc/pve/lxc)" ]; then
		echo "11 backup /etc/pve/lxc/*"
		mkdir -p $(dirname $0)/etc/pve/lxc
		cp -ra /etc/pve/lxc/* $(dirname $0)/etc/pve/lxc
	else
		echo "11 undo /etc/pve/lxc/*"
	fi
else
	echo "11 undo /etc/pve/lxc/*"
fi

if [ -e "/etc/pve/mapping" ]; then
	if [ "$(ls -A /etc/pve/mapping)" ]; then
		echo "12 backup /etc/pve/mapping/*"
		mkdir -p $(dirname $0)/etc/pve/mapping
		cp -ra /etc/pve/mapping/* $(dirname $0)/etc/pve/mapping
	else
		echo "12 undo /etc/pve/mapping/*"
	fi
else
	echo "12 undo /etc/pve/mapping/*"
fi

if [ -e "/etc/pve/storage.cfg" ]; then
	echo "13 backup /etc/pve/storage.cfg"
	mkdir -p $(dirname $0)/etc/pve
	cp -ra /etc/pve/storage.cfg $(dirname $0)/etc/pve
else
	echo "13 undo /etc/pve/storage.cfg"
fi

if [ -e "/var/lib/vz/snippets" ]; then
	if [ "$(ls -A /var/lib/vz/snippets)" ]; then
		echo "14 backup /var/lib/vz/snippets/*"
		mkdir -p $(dirname $0)/var/lib/vz/snippets
		cp -ra /var/lib/vz/snippets/* $(dirname $0)/var/lib/vz/snippets
	else
		echo "14 undo /var/lib/vz/snippets/*"
	fi
else
	echo "14 undo /var/lib/vz/snippets/*"
fi

if [ -e "/etc/systemd/system/ttyd.service" ]; then
	echo "15 backup /etc/systemd/system/ttyd.service"
	mkdir -p $(dirname $0)/etc/systemd/system
	cp /etc/systemd/system/ttyd.service $(dirname $0)/etc/systemd/system
else
	echo "15 undo /etc/systemd/system/ttyd.service"
fi

if [ -e "/etc/systemd/system/comfyui-models.service" ]; then
	echo "16 backup /etc/systemd/system/comfyui-models.service"
	mkdir -p $(dirname $0)/etc/systemd/system
	cp /etc/systemd/system/comfyui-models.service $(dirname $0)/etc/systemd/system
else
	echo "16 undo /etc/systemd/system/comfyui-models.service"
fi

if [ -e "/usr/bin/ttyd.x86_64" ]; then
	echo "17 backup /usr/bin/ttyd.x86_64"
	mkdir -p $(dirname $0)/usr/bin
	cp /usr/bin/ttyd.x86_64 $(dirname $0)/usr/bin
else
	echo "17 undo /usr/bin/ttyd.x86_64"
fi

if [ -e "/etc/nginx" ] && [ "$(ls -A /etc/nginx)" ]; then
	echo "18 backup /etc/nginx"
	mkdir -p $(dirname $0)/etc/nginx
	cp -ra /etc/nginx/* $(dirname $0)/etc/nginx
else
	echo "18 undo /etc/nginx"
fi

if [ -e "/etc/hostname" ]; then
	echo "19 backup /etc/hostname"
	mkdir -p $(dirname $0)/etc
	cp -ra /etc/hostname $(dirname $0)/etc
else
	echo "19 undo /etc/hostname"
fi

if [ -e "/etc/hosts" ]; then
	echo "20 backup /etc/hosts"
	mkdir -p $(dirname $0)/etc
	cp -ra /etc/hosts $(dirname $0)/etc
else
	echo "20 undo /etc/hosts"
fi

if [ -e "/etc/pve/nodes" ]; then
	echo "21 backup /etc/pve/nodes"
	mkdir -p $(dirname $0)/etc/pve
	cp -ra /etc/pve/nodes $(dirname $0)/etc/pve
else
	echo "21 undo /etc/pve/nodes"
fi

if [ -e "/etc/systemd/system/autostart.service" ]; then
        echo "22 backup /etc/systemd/system/autostart.service"
        mkdir -p $(dirname $0)/etc/systemd/system
        cp -ra /etc/systemd/system/autostart.service $(dirname $0)/etc/systemd/system
else
        echo "22 undo /etc/systemd/system/autostart.service"
fi

if [ -e "/etc/pve/datacenter.cfg" ]; then
	mkdir -p $(dirname $0)/etc/pve
	cp -ra /etc/pve/datacenter.cfg $(dirname $0)/etc/pve
	echo "23 backup /etc/pve/datacenter.cfg"
else
	echo "23 undo /etc/pve/datacenter.cfg"
fi

if [ -e "/etc/systemd/system/fifo.service" ]; then
	mkdir -p $(dirname $0)/etc/systemd/system
	cp -ra /etc/systemd/system/fifo.service $(dirname $0)/etc/systemd/system
	echo "24 backup /etc/systemd/system/fifo.service"
else
	echo "24 undo /etc/systemd/system/fifo.service"
fi

if [ -e "/etc/systemd/system/fbs.service" ]; then
	mkdir -p $(dirname $0)/etc/systemd/system
	cp -ra /etc/systemd/system/fbs.service $(dirname $0)/etc/systemd/system
	echo "25 backup /etc/systemd/system/fbs.service"
else
	echo "25 undo /etc/systemd/system/fbs.service"
fi

if [ -e "/etc/samba" ] && [ "$(ls -A /etc/samba/*)" ]; then
	mkdir -p $(dirname $0)/etc/samba
	cp -ra /etc/samba/* $(dirname $0)/etc/samba
	echo "26 backup /etc/samba"
else
	echo "26 undo /etc/samba"
fi

if [ -e "/etc/tgt" ] && [ "$(ls -A /etc/tgt/*)" ]; then
	mkdir -p $(dirname $0)/etc/tgt
	cp -ra /etc/tgt/* $(dirname $0)/etc/tgt
	echo "27 backup /etc/tgt"
else
	echo "27 undo tgt"
fi

if [ -e "/usr/bin/t" ]; then
	mkdir -p $(dirname $0)/usr/bin
	cp -ra /usr/bin/t $(dirname $0)/usr/bin
	echo 28 backup /usr/bin/t
else
	echo 28 undo /usr/bin/t
fi

if [ -e "/usr/bin/m" ]; then
	mkdir -p $(dirname $0)/usr/bin
	cp -ra /usr/bin/m $(dirname $0)/usr/bin
	echo 29 backup /usr/bin/m
else
	echo 29 undo /usr/bin/m
fi

if [ -e "/etc/issue" ]; then
	mkdir -p $(dirname $0)/etc
	cp -ra /etc/issue $(dirname $0)/etc
	echo "30 backup /etc/issue"
else
	echo "30 undo issue"
fi

if [ -e "/etc/containers" ]; then
	mkdir -p $(dirname $0)/etc
	cp -ra /etc/containers $(dirname $0)/etc
	echo "31 backup /etc/containers"
else
	echo "31 undo containers"
fi

if [ -e "/etc/kernel/cmdline" ]; then
	mkdir -p $(dirname $0)/etc/kernel
	cp -ra /etc/kernel/cmdline $(dirname $0)/etc/kernel
	echo 32 /etc/kernel/cmdline
fi

if [ -e "/usr/bin/e" ]; then
	mkdir -p $(dirname $0)/usr/bin
	cp /usr/bin/e $(dirname $0)/usr/bin
	echo 33 e
fi

if [ -e "/etc/systemd/system/udr.service" ]; then
	mkdir -p $(dirname $0)/etc/systemd/system
	cp -ra /etc/systemd/system/udr.service $(dirname $0)/etc/systemd/system
	echo "34 backup /etc/systemd/system/udr.service"
else
	echo "34 undo /etc/systemd/system/udr.service"
fi

if [ -e "/etc/systemd/system/fbi.service" ]; then
	mkdir -p $(dirname $0)/etc/systemd/system
	cp -ra /etc/systemd/system/fbi.service $(dirname $0)/etc/systemd/system
	echo "35 backup /etc/systemd/system/fbi.service"
else
	echo "35 undo /etc/systemd/system/fbi.service"
fi

if [ -e "/usr/bin/mm" ]; then
	mkdir -p $(dirname $0)/usr/bin
	cp /usr/bin/mm $(dirname $0)/usr/bin
	echo 36 mm
fi

if [ -e "/usr/bin/p" ]; then
	mkdir -p $(dirname $0)/usr/bin
	cp /usr/bin/p $(dirname $0)/usr/bin
	echo 37 p
fi

if [ -e "/etc/passwd" ]; then
	mkdir -p $(dirname $0)/etc
	cp /etc/passwd $(dirname $0)/etc
	echo 38 passwd
fi

if [ -e "/etc/shadow" ]; then
	mkdir -p $(dirname $0)/etc
	cp /etc/shadow $(dirname $0)/etc
	echo 39 shadow
fi

if [ -e "/etc/group" ]; then
	mkdir -p $(dirname $0)/etc
	cp /etc/group $(dirname $0)/etc
	echo 40 group
fi

# r ----------------------------------------------------
if id -u root > /dev/null 2>&1; then
	R_HOME=$(getent passwd root | cut -d: -f6)
	if [ -e "$R_HOME/.bashrc" ]; then
		mkdir -p $(dirname $0)$R_HOME
		cp $R_HOME/.bashrc $(dirname $0)$R_HOME
		echo root 1 backup root bashrc
	else
		echo root 1 undo root s bashrc
	fi

	if [ -e "$R_HOME/.tmux.conf" ]; then
		mkdir -p $(dirname $0)$R_HOME
		cp -a $R_HOME/.tmux.conf $(dirname $0)$R_HOME
		echo "root 2 backup root tmux"
	else
		echo "root 2 unbackup root .tmux.conf"
	fi

	if [ -e "$R_HOME/.bg.jpg" ]; then
		mkdir -p $(dirname $0)$R_HOME
		cp -ra $R_HOME/.bg.jpg $(dirname $0)$R_HOME
		echo root 3 $R_HOME/.bg.jpg
	fi

	if [ -e "$R_HOME/.config/fish/config.fish" ]; then
		mkdir -p $(dirname $0)$R_HOME/.config/fish
		cp $R_HOME/.config/fish/config.fish $(dirname $0)$R_HOME/.config/fish
		echo root 4 config.fish
	fi

	if [ -e "$R_HOME/.bg.mp4" ]; then
		mkdir -p $(dirname $0)$R_HOME
		cp -ra $R_HOME/.bg.mp4 $(dirname $0)$R_HOME
		echo root 5 $R_HOME/.bg.mp4
	fi

	if [ -e "$R_HOME/.bg.mlterm.jpg" ]; then
		mkdir -p $(dirname $0)$R_HOME
		cp -ra $R_HOME/.bg.mlterm.jpg $(dirname $0)$R_HOME
		echo root 6 $R_HOME/.bg.mlterm.jpg
	fi

	if [ -e "$R_HOME/.mlterm" ]; then
		mkdir -p $(dirname $0)$R_HOME
		cp -ra $R_HOME/.mlterm $(dirname $0)$R_HOME
		echo root 7 $R_HOME/.mlterm
	fi

	if [ -e "$R_HOME/Pictures" ] && [ "$(ls -A $R_HOME/Pictures/)" ]; then
		mkdir -p $(dirname $0)$R_HOME/Pictures
		cp -ra $R_HOME/Pictures/* $(dirname $0)$R_HOME/Pictures
		echo root 8 $R_HOME/Pictures
	fi

	if [ -e "$R_HOME/.profile" ]; then
		mkdir -p $(dirname $0)$R_HOME
		cp -ra $R_HOME/.profile $(dirname $0)$R_HOME
		echo root 9 $R_HOME/.profile
	fi

	if [ -e "$R_HOME/.config/wifi" ] && [ "$(ls -A $R_HOME/.config/wifi)" ]; then
		mkdir -p $(dirname $0)$R_HOME/.config/wifi
		cp -ra $R_HOME/.config/wifi/* $(dirname $0)$R_HOME/.config/wifi
		echo root 10 $R_HOME/.config/wifi
	fi
fi
# sa ----------------------------------------------------------------------------

if [ -e "/home/sa/Desktop" ]; then
	if [ "$(ls -A /home/sa/Desktop)" ]; then
		echo "sa 1 backup /home/sa/Desktop/*"
		mkdir -p $(dirname $0)/home/sa/Desktop
		cp -ra /home/sa/Desktop/* $(dirname $0)/home/sa/Desktop
	else
		echo "sa 1 undo /home/sa/Desktop/*"
	fi
else
	echo "sa 1 undo /home/sa/Desktop/*"
fi

if [ -e "/home/sa/appShell" ]; then
	if [ "$(ls -A /home/sa/appShell)" ]; then
		echo "sa 2 backup /home/sa/appShell/*"
		mkdir -p $(dirname $0)/home/sa/appShell
		cp -ra /home/sa/appShell/* $(dirname $0)/home/sa/appShell
	else
		echo "sa 2 undo /home/sa/appShell/*"
	fi
else
	echo "sa 2 undo /home/sa/appShell/*"
fi

if [ -e "/home/sa/appImages" ]; then
	if [ "$(ls -A /home/sa/appImages)" ]; then
		echo "sa 3 backup /home/sa/appImages/*"
		mkdir -p $(dirname $0)/home/sa/appImages
		cp -ra /home/sa/appImages/* $(dirname $0)/home/sa/appImages
	else
		echo "sa 3 undo /home/sa/appImages/*"
	fi
else
	echo "sa 3 undo /home/sa/appImages/*"
fi

if [ -e "/home/sa/.tmux.conf" ]; then
	mkdir -p $(dirname $0)/home/sa
	cp -a /home/sa/.tmux.conf $(dirname $0)/home/sa
	echo "sa 4 backup /home/sa/.tmux.conf"
else
	echo "sa 4 undo /home/sa/.tmux.conf"
fi

if [ -e "/home/sa/.bashrc" ]; then
	mkdir -p $(dirname $0)/home/sa
	cp -ra /home/sa/.bashrc $(dirname $0)/home/sa
	echo sa 5 back sa bash co
else
	echo "sa 5 undo sa bashrc"
fi

if [ -e "/home/sa/桌面" ]; then
	if [ "$(ls -A /home/sa/桌面)" ]; then
		echo "sa 6 backup /home/sa/桌面/*"
		mkdir -p $(dirname $0)/home/sa/桌面
		cp -ra /home/sa/桌面/*	$(dirname $0)/home/sa/桌面
	else
		echo "sa 6 undo /home/sa/桌面/*"
	fi
else
	echo "sa 6 undo /home/sa/桌面/*"
fi

if [ -e "/home/sa/.config/fish/config.fish" ]; then
	mkdir -p $(dirname $0)/home/sa/.config/fish
	cp -ra /home/sa/.config/fish/config.fish $(dirname $0)/home/sa/.config/fish
	echo sa 7 config.fish
fi

if [ -e "/home/sa/.config/niri/config.kdl" ]; then
	mkdir -p $(dirname $0)/home/sa/.config/niri
	cp -ra /home/sa/.config/niri/config.kdl $(dirname $0)/home/sa/.config/niri
	echo sa 8 user sa config.kdl
fi

if [ -e "/home/sa/.profile" ]; then
	mkdir -p $(dirname $0)/home/sa
	cp -ra /home/sa/.profile $(dirname $0)/home/sa
	echo sa 9 user sa profile
fi

if [ -e "/home/sa/.switch-bg.sh" ]; then
	mkdir -p $(dirname $0)/home/sa
	cp -ra /home/sa/.switch-bg.sh $(dirname $0)/home/sa
	echo sa 10 user sa /home/sa/.switch-bg.sh
fi

if [ -e "/home/sa/Pictures" ] && [ "$(ls -A /home/sa/Pictures/)" ]; then
	mkdir -p $(dirname $0)/home/sa/Pictures
	cp -ra /home/sa/Pictures/* $(dirname $0)/home/sa/Pictures
	echo sa 11 /home/sa/Pictures
fi

if [ -e "/home/sa/.config/wifi" ] && [ "$(ls -A /home/sa/.config/wifi)" ]; then
	mkdir -p $(dirname $0)/home/sa/.config/wifi
	cp -ra /home/sa/.config/wifi/* $(dirname $0)/home/sa/.config/wifi
	echo sa 12 /home/sa/.config/wifi
fi

echo "please make fstab done"

else
	echo "not pve"
fi
