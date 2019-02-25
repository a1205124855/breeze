#!/bin/bash
yum install epel-release -y
rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
rpm -Uvh https://www.elrepo.org/elrepo-release-7.0-3.el7.elrepo.noarch.rpm
yum --enablerepo=elrepo-kernel install kernel-ml kernel-ml-devel -y
cp /boot/grub2/grub.cfg /boot/grub2/grub.cfg.$(date "+%F").bak
grub2-mkconfig -o /boot/grub2/grub.cfg
grub2-set-default 0
read -p "需要重启VPS，是否现在重启 ? [Y/n] :" yn
   [ -z "${yn}" ] && yn="y"
      if [[ $yn == [Yy] ]]; then
         echo -e "VPS 重启中..."
         reboot
   fi
