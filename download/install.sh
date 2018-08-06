#!/bin/bash

echo "---------------------------------------------------------------------------------------------------------------------"
echo "Welcome to Desktop environment and Remote connection tool ! V0.1"
echo "System requirements: CentOS 7+ New installation"
echo "Recommended system : [Original] Network one-click Reinstall CentOS 7 (Official, Pure, Safe, Efficient)"
echo "URL : https://tech.cxthhhhh.com/linux/2018/07/30/original-network-one-click-reinstall-centos-7-official-pure-safe-efficient-en.html"
echo "---------------------------------------------------------------------------------------------------------------------"
echo "from https://tech.cxthhhhh.com - 2018/08/06 - MeowLove"
echo "---------------------------------------------------------------------------------------------------------------------"
echo Press any key to continue! Exit with 'Ctrl'+'C' !

echo -e "\n"
sudo cd /root
yum install epel-release -y
echo "Start creating Swaps Memory, please wait..."
dd if=/dev/zero of=/var/swapd bs=1024 count=3145728
mkswap /var/swapd
chmod 0644 /var/swapd
swapon /var/swapd
echo '/var/swapd   swap   swap   default 0 0' >> /etc/fstab
echo "---------------------------------------------------------------------------------------------------------------------"
echo "Swaps Memory is Created  is [OK]"
echo "---------------------------------------------------------------------------------------------------------------------"

echo -e "\n"
sudo cd /root
yum groupinstall "X Window System" -y
yum groupinstall "MATE Desktop" -y
yum remove firefox -y
yum groupinstall "Chinese support" -y
yum groups mark install "Chinese support" -y
yum install cjkuni-ukai-fonts cjkuni-uming-fonts -y
yum install fontforge -y
yum install ibus-libpinyin im-chooser -y
localectl set-locale LANG=zh_CN.UTF8
echo "---------------------------------------------------------------------------------------------------------------------"
echo "Desktop environment is installed  is [OK]"
echo "---------------------------------------------------------------------------------------------------------------------"

echo -e "\n"
sudo cd /root
touch /etc/yum.repos.d/google-chrome.repo
echo '[google-chrome]
name=google-chrome
baseurl=http://dl.google.com/linux/chrome/rpm/stable/x86_64
enabled=1
gpgcheck=1
gpgkey=https://dl.google.com/linux/linux_signing_key.pub'>/etc/yum.repos.d/google-chrome.repo
echo -e "\n"
cat /etc/yum.repos.d/google-chrome.repo
yum install google-chrome-stable -y
echo "---------------------------------------------------------------------------------------------------------------------"
echo "The Chrome Already installed  is [OK]"
echo "---------------------------------------------------------------------------------------------------------------------"

echo -e "\n"
yum install tigervnc-server tigervnc -y
yum install xrdp -y
touch ~/.Xclients
echo "mate-session" > ~/.Xclients
chmod a+x ~/.Xclients
systemctl enable xrdp
systemctl start xrdp
firewall-cmd --add-port=3389/tcp --permanent
firewall-cmd --reload
echo "---------------------------------------------------------------------------------------------------------------------"
echo "Remote connection RDP is installed  is [OK]"
echo "---------------------------------------------------------------------------------------------------------------------"

echo -e "\n\n\n"
echo "---------------------------------------------------------------------------------------------------------------------"
echo "The current default system language is Chinese."
echo "If you are an English user, please execute ' sudo localectl set-locale LANG=en_US.UTF-8 '"
echo "---------------------------------------------------------------------------------------------------------------------"
echo "Warning: Now, you need to pay attention to the following, please visit this page."
echo "Technical Blog | 技術博客 | 易，窮則變，變則通，通則久。是以自天佑之，吉無不利"
echo "https://tech.cxthhhhh.com"
echo "---------------------------------------------------------------------------------------------------------------------"
echo "End to Desktop environment and Remote connection tool ! V0.1"
echo "Everything is ready and the system is restarting. Then you can connect via (RDP)IP:3389."
echo "---------------------------------------------------------------------------------------------------------------------"
echo "from https://tech.cxthhhhh.com - 2018/08/06 - MeowLove"
echo "---------------------------------------------------------------------------------------------------------------------"
reboot !
echo -e "\n"