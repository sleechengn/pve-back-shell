#!/usr/bin/env bash
#set -e

if [ -e "$(dirname $0)/etc/fstab" ]; then
	echo "01 restore /etc/fstab"
	cp -ra $(dirname $0)/etc/fstab /etc
fi

if [ -e "$(dirname $0)/etc/modules" ]; then
	echo "02 restore /etc/modules"
	cp -ra $(dirname $0)/etc/modules /etc
	update-initramfs -u -k all
fi

if [ -e "$(dirname $0)/etc/default/grub" ]; then
	echo "03 restore /etc/default/grub"
	cp -ra $(dirname $0)/etc/default/grub /etc/default/
	update-grub
fi

if [ -e "$(dirname $0)/etc/rc.local" ]; then
	echo "04 restore /etc/rc.local"
	cp -ra $(dirname $0)/etc/rc.local /etc
	chmod +x /etc/rc.local
	systemctl enable rc-local
	echo "不要忘记装hd-idle"
fi

if [ "$(ls -A $(dirname $0)/etc/modprobe.d)" ]; then
	echo "05 restore /etc/modprobe.d/*"
	cp -ra $(dirname $0)/etc/modprobe.d/* /etc/modprobe.d
	update-initramfs -u -k all
fi

if [ -e "$(dirname $0)/etc/network/interfaces" ]; then
	echo "06 restore /etc/network/interfaces"
	cp -ra $(dirname $0)/etc/network/interfaces /etc/network
fi

if [ "$(ls -A $(dirname $0)/etc/systemd/network)" ]; then
	echo "07 restore /etc/systemd/network/*"
	cp -ra $(dirname $0)/etc/systemd/network/* /etc/systemd/network
fi

if [ "$(ls -A $(dirname $0)/opt)" ]; then
	echo "08 restore /opt/*"
	cp -ra $(dirname $0)/opt/* /opt
fi

if [ "$(ls -A $(dirname $0)/etc/pve/qemu-server)" ]; then
	echo "09 restore /etc/pve/qemu-server/*"
	rm -rf /etc/pve/qemu-server/*
	cp -ra $(dirname $0)/etc/pve/qemu-server/* /etc/pve/qemu-server
fi

if [ -e "$(dirname $0)/usr/share/kvm/vbios" ]; then
	echo "10 restore /usr/share/kvm/vbios/*"
	cp -ra $(dirname $0)/usr/share/kvm/vbios /usr/share/kvm
fi

if [ "$(ls -A $(dirname $0)/etc/pve/lxc)" ]; then
	echo "11 restore /etc/pve/lxc/*"
	if [ -e "/etc/pve/lxc" ]; then
		cp -ra $(dirname $0)/etc/pve/lxc/* /etc/pve/lxc
	fi
fi

if [ "$(ls -A  $(dirname $0)/etc/pve/mapping)" ]; then
	echo "12 restore /etc/pve/mapping/*"
	if [ -e "/etc/pve/mapping" ]; then
		cp -ra $(dirname $0)/etc/pve/mapping/* /etc/pve/mapping
	fi
fi

if [ -e "$(dirname $0)/etc/pve/storage.cfg" ]; then
	echo "13 restore /etc/pve/storage.cfg"
	if [ -e "/etc/pve" ]; then
	    cp -ra $(dirname $0)/etc/pve/storage.cfg /etc/pve
	fi
fi

if [ -e "$(dirname $0)/var/lib/vz/snippets" ]; then
	echo "14 restore /var/lib/vz/snippets"
	cp -ra $(dirname $0)/var/lib/vz/snippets /var/lib/vz
fi

if [ -e "$(dirname $0)/etc/systemd/system/comfyui-models.service" ]; then
	echo "15 restore /etc/systemd/system/comfyui-models.service"
	cp -ra $(dirname $0)/etc/systemd/system/comfyui-models.service /etc/systemd/system
	systemctl enable comfyui-models
fi

if [ -e "$(dirname $0)/usr/bin/ttyd.x86_64" ]; then
	echo "16 restore /usr/bin/ttyd.x86_64"
	rm -rf /usr/bin/ttyd.x86_64
	cp -ra $(dirname $0)/usr/bin/ttyd.x86_64 /usr/bin
fi

if [ -e "$(dirname $0)/etc/nginx" ]; then
	cp -ra $(dirname $0)/etc/nginx /etc
	echo "17 restore /etc/nginx"
fi

if [ -e "$(dirname $0)/etc/systemd/system/ttyd.service" ]; then
	echo "18 restore/etc/systemd/system/ttyd.service"
    cp -ra $(dirname $0)/etc/systemd/system/ttyd.service /etc/systemd/system
    systemctl enable ttyd
fi

if [ -e "$(dirname $0)/etc/systemd/system/fbs.service" ]; then
	echo "19 restore /etc/systemd/system/fbs.service"
    cp -ra $(dirname $0)/etc/systemd/system/fbs.service /etc/systemd/system
    systemctl enable fbs
fi

if [ -e "$(dirname $0)/etc/systemd/system/autostart.service" ]; then
        echo "20 restore /etc/systemd/system/autostart.service"
        cp -ra $(dirname $0)/etc/systemd/system/autostart.service /etc/systemd/system
        systemctl enable autostart.service
fi

if [ -e "$(dirname $0)/etc/pve/datacenter.cfg" ]; then
	echo "21 restore /etc/pve/datacenter.cfg"
	cp -ra $(dirname $0)/etc/pve/datacenter.cfg /etc/pve
fi

if [ -e "$(dirname $0)/etc/systemd/system/fifo.service" ]; then
	echo "22 restore /etc/systemd/system/fifo.service"
	cp -ra $(dirname $0)/etc/systemd/system/fifo.service /etc/systemd/system
	systemctl enable fifo
fi

if [ -e "$(dirname $0)/etc/samba" ] && [ "$(ls -A $(dirname $0)/etc/samba/*)" ]; then
	mkdir -p /etc/samba
	cp -ra $(dirname $0)/etc/samba/* /etc/samba
	echo "23 restore $(dirname $0)/etc/samba"
else
	echo "23 undo $(dirname $0)/etc/samba"
fi

if [ -e "$(dirname $0)/etc/tgt" ] && [ "$(ls -A $(dirname $0)/etc/tgt/*)" ]; then
	mkdir -p /etc/tgt
	cp -ra $(dirname $0)/etc/tgt/* /etc/tgt
	echo "24 restore tgt"
else
	echo "24 undo tgt"
fi

if [ -e "$(dirname $0)/usr/bin/t" ]; then
	mkdir -p /usr/bin
	cp -ra $(dirname $0)/usr/bin/t /usr/bin
	echo 25 restore /usr/bin/t
else
	echo 25 undo /usr/bin/t
fi

if [ -e "$(dirname $0)/usr/bin/m" ]; then
	mkdir -p /usr/bin
	cp -ra $(dirname $0)/usr/bin/m /usr/bin
	echo 26 restore /usr/bin/m
else
	echo 26 undo /usr/bin/m
fi

if [ -e "$(dirname $0)/etc/issue" ]; then
	mkdir -p /etc
	cp -ra $(dirname $0)/etc/issue /etc
	echo "27 restore issue"
else
	echo "27 undo issue"
fi

if [ -e "$(dirname $0)/etc/containers" ]; then
	mkdir -p /etc
	cp -ra $(dirname $0)/etc/containers /etc
	echo "28 restore containers"
else
	echo "28 undo containers"
fi

if [ -e "$(dirname $0)/etc/kernel/cmdline" ]; then
	mkdir -p /etc/kernel
	cp -ra $(dirname $0)/etc/kernel/cmdline /etc/kernel
	echo 29 restore cmdline
	proxmox-boot-tool refresh
fi

if [ -e "$(dirname $0)/usr/bin/e" ]; then
	mkdir -p /usr/bin
	cp -ra $(dirname $0)/usr/bin/e /usr/bin
	echo 30 restore $(dirname $0)/e
fi

if [ -e "$(dirname $0)/etc/systemd/system/udr.service" ]; then
	mkdir -p /etc/systemd/system
	cp -ra $(dirname $0)/etc/systemd/system/udr.service /etc/systemd/system
	if [ -e "/opt/udr/udr.sh" ] || [ -e "$(dirname $0)/opt/udr/udr.sh" ]; then
		systemctl enable --now udr
	fi
	echo "31 restore /etc/systemd/system/udr.service"
fi

if [ -e "$(dirname $0)/etc/systemd/system/fbi.service" ]; then
	mkdir -p /etc/systemd/system
	echo "32 restore /etc/systemd/system/fbi.service"
	cp -ra $(dirname $0)/etc/systemd/system/fbi.service /etc/systemd/system
	systemctl enable fbi
fi

if [ -e "$(dirname $0)/usr/bin/mm" ]; then
	mkdir -p /usr/bin
	cp -ra $(dirname $0)/usr/bin/mm /usr/bin
	echo 33 restore /usr/bin/mm
else
	echo 33 undo /usr/bin/mm
fi

if [ -e "$(dirname $0)/usr/bin/p" ]; then
	mkdir -p /usr/bin
	cp -ra $(dirname $0)/usr/bin/p /usr/bin
	echo 34 restore /usr/bin/p
else
	echo 34 undo /usr/bin/p
fi

# r ---------------------------------

if id -u root > /dev/null 2>&1; then
	if [ -e "$(dirname $0)/etc/passwd" ]; then
		R_HOME=$(cat $(dirname $0)/etc/passwd|grep "^root:"|cut -d: -f6)
		if [ "$R_HOME" ]; then
			RT_HOME=$(getent passwd root | cut -d: -f6)

			if [ -e "$(dirname $0)$R_HOME/.tmux.conf" ]; then
				cp -a $(dirname $0)$R_HOME/.tmux.conf $RT_HOME
				echo "root 1 .tmux.conf"
			fi

			if [ -e "$(dirname $0)$R_HOME/.bashrc" ]; then
				cp -ra $(dirname $0)$R_HOME/.bashrc $RT_HOME
				echo "root 2 .bashrc"
			else
				echo "root 2 .bashrc"
			fi

			if [ -e "$(dirname $0)$R_HOME/.bg.jpg" ]; then
				mkdir -p $RT_HOME
				cp -ra $(dirname $0)$R_HOME/.bg.jpg $RT_HOME
				echo "root 3 restore $(dirname $0)$R_HOME/.bg.jpg"
			fi

			if [ -e "$(dirname $0)$R_HOME/.config/fish/config.fish" ]; then
				mkdir -p $RT_HOME/.config/fish
				cp -ra $(dirname $0)$R_HOME/.config/fish/config.fish $RT_HOME/.config/fish
				echo root 4 $(dirname $0)$R_HOME/.config/fish/config.fish
			fi

			if [ -e "$(dirname $0)$R_HOME/.bg.mp4" ]; then
				mkdir -p $RT_HOME
				cp -ra $(dirname $0)$R_HOME/.bg.mp4 $RT_HOME
				echo root 5 $(dirname $0)$R_HOME/.bg.mp4
			else
				echo "root 5 undo $RT_HOME/.bg.mp4"
			fi

			if [ -e "$(dirname $0)$R_HOME/.mlterm" ]; then
				mkdir -p $RT_HOME
				cp -ra $(dirname $0)$R_HOME/.mlterm $RT_HOME
				echo root 6 $(dirname $0)$R_HOME/.mlterm
			else
				echo "root 6 undo .mlterm"
			fi

			if [ -e "$(dirname $0)$R_HOME/.bg.mlterm.jpg" ]; then
				mkdir -p $RT_HOME
				cp -ra $(dirname $0)$R_HOME/.bg.mlterm.jpg $RT_HOME
				echo root 7 restore $(dirname $0)$R_HOME/.bg.mlterm.jpg
			else
				echo "root 7 undo .bg.mlterm.jpg"
			fi

			if [ -e "$(dirname $0)$R_HOME/Pictures" ] && [ "$(ls -A $(dirname $0)$R_HOME/Pictures/)" ]; then
				mkdir -p $RT_HOME/Pictures
				cp -ra $(dirname $0)$R_HOME/Pictures/* $RT_HOME/Pictures
				echo root 8 restore $(dirname $0)$R_HOME/Pictures
			else
				echo "root 8 undo Pictures"
			fi

			if [ -e "$(dirname $0)$R_HOME/.profile" ]; then
				mkdir -p $RT_HOME
				cp -ra $(dirname $0)$R_HOME/.profile $RT_HOME
				echo root 9 restore $(dirname $0)$R_HOME/.profile
			else
				echo "root 9 undo $RT_HOME/.profile"
			fi

			if [ -e "$(dirname $0)$R_HOME/.profile" ]; then
				mkdir -p $RT_HOME
				cp -ra $(dirname $0)$R_HOME/.profile $RT_HOME
				echo root 10 restore $(dirname $0)$R_HOME/.profile
			else
				echo "root 10 undo $RT_HOME/.profile"
			fi

			if [ -e "$(dirname $0)$R_HOME/.gitconfig" ]; then
				mkdir -p $RT_HOME
				cp -ra $(dirname $0)$R_HOME/.gitconfig  $RT_HOME
				echo root 11 restore $(dirname $0)$R_HOME/.gitconfig
			else
				echo "root 11 undo $RT_HOME/.gitconfig"
			fi

			if [ -e "$(dirname $0)$R_HOME/.git-credentials" ]; then
				mkdir -p $RT_HOME
				cp -ra $(dirname $0)$R_HOME/.git-credentials  $RT_HOME
				echo root 12 restore $(dirname $0)$R_HOME/.git-credentials
			else
				echo "root 12 undo .git-credentials"
			fi

		else
			echo "BACKUP root home not zero"
		fi
	else
		echo "$(dirname $0)/etc/passwd not exist"
	fi
else
	echo "root zero"
fi

# sa ------------------------------------------------------------------

if ! getent group sa > /dev/null 2>&1; then
	groupadd --gid 100000 sa
else
	if [ ! $(getent group sa|cut -d: -f3) -eq 100000 ]; then
		groupmod --gid 100000 sa
	fi
fi

if ! id -u sa > /dev/null 2>&1; then
	useradd -m --uid 100000 -g sa sa
else
	if [ ! $(id -g sa) -eq 100000 ]; then
		usermod --gid 100000 sa
	fi
fi

if id -u sa > /dev/null 2>&1; then
	if [ -e "$(dirname $0)/etc/passwd" ]; then
		SA_HOME=$(cat $(dirname $0)/etc/passwd|grep "^sa:"|cut -d: -f6)
		SAT_HOME=$(getent passwd sa | cut -d: -f6)
		if [ "$SA_HOME" ]; then
			if [ -e "$(dirname $0)$SA_HOME/桌面" ]; then
				echo "sa 1 restore $SAT_HOME/桌面"
				rm -rf $SAT_HOME/桌面
				cp -ra $(dirname $0)$SA_HOME/桌面 $SAT_HOME
				chown -R sa:sa $SAT_HOME/桌面
			fi

			if [ -e "$(dirname $0)$SA_HOME/Desktop" ]; then
				echo "sa 2 restore $SAT_HOME/Desktop"
				rm -rf $SAT_HOME/Desktop
				cp -ra $(dirname $0)$SA_HOME/Desktop $SAT_HOME
				chown -R sa:sa $SAT_HOME/Desktop
			fi

			if [ -e "$(dirname $0)$SA_HOME/appImages" ]; then
				echo "sa 3 restore $SAT_HOME/appImages"
				rm -rf $SAT_HOME/appImages
				cp -ra $(dirname $0)$SA_HOME/appImages $SAT_HOME
				chown -R sa:sa $SAT_HOME/appImages
			fi

			if [ -e "$(dirname $0)$SA_HOME/appShell" ]; then
				echo "sa 4 restore $SAT_HOME/appShell"
				rm -rf $SAT_HOME/appShell
				cp -ra $(dirname $0)$SA_HOME/appShell $SAT_HOME
				chown -R sa:sa $SAT_HOME/appShell
			fi

			if [ -e "$(dirname $0)$SA_HOME/.tmux.conf" ]; then
				echo "sa 5 restore $SAT_HOME/.tmux.conf"
				cp -ra $(dirname $0)$SA_HOME/.tmux.conf $SAT_HOME
				chown -R sa:sa $SAT_HOME/.tmux*
			fi

			if [ -e "$(dirname $0)$SA_HOME/.config/fish/config.fish" ]; then
				mkdir -p $SAT_HOME/.config/fish
				chown -R sa $SAT_HOME/.config
				cp -ra $(dirname $0)$SA_HOME/.config/fish/config.fish $SAT_HOME/.config/fish
				echo sa 6 restore $(dirname $0)$SA_HOME/.config/fish/config.fish
				chown -R sa $SAT_HOME/.config
			fi

			if [ -e "$(dirname $0)$SA_HOME/.bashrc" ]; then
				mkdir -p $SAT_HOME
				cp -ra $(dirname $0)$SA_HOME/.bashrc $SAT_HOME
				echo sa 7 restore sa ba
			else
				echo sa 7 undo .bashrc
			fi

			if [ -e "$(dirname $0)$SA_HOME/.config/niri/config.kdl" ]; then
				mkdir -p $SAT_HOME/.config/niri
				chown -R sa $SAT_HOME/.config
				cp -ra $(dirname $0)$SA_HOME/.config/niri/config.kdl $SAT_HOME/.config/niri
				echo sa 8 restore $SAT_HOME/.config/niri/config.kdl
			else
				echo "sa 8 undo config.kdl"
			fi

			if [ -e "$(dirname $0)$SA_HOME/.profile" ]; then
				mkdir -p $SAT_HOME
				cp -ra $(dirname $0)$SA_HOME/.profile $SAT_HOME
				chown -R sa $SAT_HOME/.profile
				echo sa 9 restore $SAT_HOME/.profile
			else
				echo "sa 9 undo $SAT_HOME/.profile"
			fi

			if [ -e "$(dirname $0)$SA_HOME/.switch-bg.sh" ]; then
				mkdir -p $SAT_HOME
				cp -ra $(dirname $0)$SA_HOME/.switch-bg.sh $SAT_HOME
				chown -R sa $SAT_HOME/.switch-bg.sh
				echo sa 10 restore $SAT_HOME/.switch-bg.sh
			else
				echo "sa 10 undo $SAT_HOME/.switch-bg.sh"
			fi

			if [ -e "$(dirname $0)$SA_HOME/Pictures" ] && [ "$(ls -A $(dirname $0)$SA_HOME/Pictures/)" ]; then
				mkdir -p $SAT_HOME/Pictures
				cp -ra $(dirname $0)$SA_HOME/Pictures/* $SAT_HOME/Pictures
				chown -R sa $SAT_HOME/Pictures
				echo sa 11 restore $(dirname $0)$SA_HOME/Pictures
			else
				echo "sa 11 undo Pictures"
			fi

			if [ -e "$(dirname $0)$SA_HOME/.config/wifi" ] && [ "$(ls -A $(dirname $0)$SA_HOME/.config/wifi)" ]; then
				mkdir -p $SAT_HOME/.config/wifi
				cp -ra $(dirname $0)$SA_HOME/.config/wifi/* $SAT_HOME/.config/wifi
				chown -R sa $SAT_HOME/.config
				echo sa 12 restore $(dirname $0)$SA_HOME/.config/wifi
			else
				echo "sa 12 undo wifi"
			fi

			if [ -e "$(dirname $0)$SA_HOME/.gitconfig" ]; then
				mkdir -p $SAT_HOME
				cp -ra $(dirname $0)$SA_HOME/.gitconfig $SAT_HOME
				chown -R sa $SAT_HOME/.gitconfig
				echo sa 13 restore $(dirname $0)$SA_HOME/.gitconfig
			else
				echo "sa 13 undo .gitconfig"
			fi

			if [ -e "$(dirname $0)$SA_HOME/.git-credentials" ]; then
				mkdir -p $SAT_HOME
				cp -ra $(dirname $0)$SA_HOME/.git-credentials $SAT_HOME
				chown -R sa $SAT_HOME/.git-credentials
				echo sa 14 restore $(dirname $0)$SA_HOME/.git-credentials
			else
				echo "sa 14 undo .git-credentials"
			fi

		else
			echo "BACKUP sa home not zero"
		fi
	else
		echo "$(dirname $0)/etc/passwd not exist"
	fi
else
	echo "sa zero"
fi

$(dirname $0)/nodes.sh

echo "Warning! You must modify fstab to match your actual configuration."
