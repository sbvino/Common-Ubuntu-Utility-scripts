### First Install 8.0.x because 8.1 install fails


# 192.168.11.196:/mnt/nvme /mnt/nvme nfs4 defaults,user,exec,_netdev 0 0
# BC:24:11:D7:91:CB

nano /etc/apt/sources.list.d/pve-enterprise.list
    # Proxmox VE pve-no-subscription repository provided by proxmox.com,
    # NOT recommended for production use
    deb http://download.proxmox.com/debian/pve bookworm pve-no-subscription

nano /etc/apt/sources.list.d/ceph.list
    # Installs 8.1
    deb http://download.proxmox.com/debian/ceph-reef bookworm no-subscription
apt update && apt install git pve-headers mokutil -y && rm -rf /var/lib/dkms/i915-sriov-dkms* && rm -rf /usr/src/i915-sriov-dkms* && rm -rf ~/i915-sriov-dkms && KERNEL=$(uname -r); KERNEL=${KERNEL%-pve}
cd ~
git clone https://github.com/strongtz/i915-sriov-dkms.git
cd ~/i915-sriov-dkms
cp -a ~/i915-sriov-dkms/dkms.conf{,.bak}
sed -i 's/"@_PKGBASE@"/"i915-sriov-dkms"/g' ~/i915-sriov-dkms/dkms.conf
sed -i 's/"@PKGVER@"/"'"$KERNEL"'"/g' ~/i915-sriov-dkms/dkms.conf
sed -i 's/ -j$(nproc)//g' ~/i915-sriov-dkms/dkms.conf
cat ~/i915-sriov-dkms/dkms.conf
apt install --reinstall dkms -y
dkms add .
cd /usr/src/i915-sriov-dkms-$KERNEL
dkms status
dkms install -m i915-sriov-dkms -v $KERNEL -k $(uname -r) --force -j 1
mokutil --import /var/lib/dkms/mok.pub
cp -a /etc/default/grub{,.bak}
sudo sed -i '/^GRUB_CMDLINE_LINUX_DEFAULT/c\GRUB_CMDLINE_LINUX_DEFAULT="quiet intel_iommu=on iommu=pt i915.enable_guc=3 i915.max_vfs=7"' /etc/default/grub
update-grub
update-initramfs -u -k all
apt install sysfsutils -y
lspci | grep VGA
echo "devices/pci0000:00/0000:00:02.0/sriov_numvfs = 7" > /etc/sysfs.conf
cat /etc/sysfs.conf
reboot
lspci | grep VGA
dmesg | grep i915
mkdir /mnt/nvme
sudo nano /etc/fstab
    /dev/nvme0n1 /mnt/nvme ext4 defaults 0 0
systemctl daemon-reload
mount -a
apt install nfs-kernel-server -y
sudo systemctl start nfs-kernel-server
sudo systemctl enable nfs-kernel-server
sudo systemctl status nfs-kernel-server
sudo nano /etc/exports
    /mnt/nvme 192.168.11.0/24(rw,sync,no_subtree_check,no_root_squash)
sudo exportfs -a
sudo chown -R nobody:nogroup /mnt/nvme/
sudo chmod -R 755 /mnt/nvme/

