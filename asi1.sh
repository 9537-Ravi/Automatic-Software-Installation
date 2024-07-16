                  ####################################################################################################
                  #                                           asi.sh                                                 #
                  #         Written for DELHIVERY LTD. for the more Details Contact Ravindra (Rajkot)                #
                  #           If you find a bug, please notify us via the email address provided below.              #
		          #                             Email : it.ravi@gmail.com                                            #
                  #                 giving proper credit to Ravindra Thakar from Delhivery IT Team                   #
                  #                                       "Thank You...!"                                            #
                  ####################################################################################################

#!/bin/bash
#https://linuxhint.com/install_openoffice_ubuntu_1804/
#install ssh 
#change admin password
#change correct name for admin
echo ""
echo  -e "\e[31;43m*****ASI-Automatic Software Installation By Ravindra Thakar W84459 - DELHIVERY *****\e[0m"
echo ""
echo "██████  ███████ ██      ██   ██ ██ ██    ██ ███████ ██████  ██    ██ ";
echo "██   ██ ██      ██      ██   ██ ██ ██    ██ ██      ██   ██  ██  ██  ";
echo "██   ██ █████   ██      ███████ ██ ██    ██ █████   ██████    ████   ";
echo "██   ██ ██      ██      ██   ██ ██  ██  ██  ██      ██   ██    ██    ";
echo "██████  ███████ ███████ ██   ██ ██   ████   ███████ ██   ██    ██    ";
echo "                                                                     ";
echo "                                                                     ";
echo ""
date
echo  -e "\e[3;43m*************** Software is Not Completed - i'm Working on my offtime ***************\e[0m"
echo ""
echo  -e "\e[31;43m*********Note : To stop The Script Press Ctrl + C or Ctrl + D *********\e[0m"
### Colors ##
ESC=$(printf '\033') RESET="${ESC}[0m" BLACK="${ESC}[30m" RED="${ESC}[31m"
GREEN="${ESC}[32m" YELLOW="${ESC}[33m" BLUE="${ESC}[34m" MAGENTA="${ESC}[35m"
CYAN="${ESC}[36m" WHITE="${ESC}[37m" DEFAULT="${ESC}[39m"

### Color Functions ##

greenprint() { printf "${GREEN}%s${RESET}\n" "$1"; }
blueprint() { printf "${BLUE}%s${RESET}\n" "$1"; }
redprint() { printf "${RED}%s${RESET}\n" "$1"; }
yellowprint() { printf "${YELLOW}%s${RESET}\n" "$1"; }
magentaprint() { printf "${MAGENTA}%s${RESET}\n" "$1"; }
cyanprint() { printf "${CYAN}%s${RESET}\n" "$1"; }
fn_goodafternoon() { echo; echo "Good afternoon."; }
fn_goodmorning() { echo; echo "Good morning."; }
fn_bye() { echo "Bye bye."; exit 0; }
fn_fail() { echo "Wrong option." exit 1; }

mainmenu() {
echo -ne "
$(magentaprint 'MAIN MENU')
$(greenprint '1)') Ubuntu Full Audit
$(greenprint '2)') System Information
$(greenprint '3)') Edit Hostname
$(greenprint '4)') Automatic Offline Software Installation
$(redprint '5)') Automatic Online Software Installation
$(greenprint '6)') Mannual Software Installation
$(redprint '7)') Custom Audit
$(redprint '8)') Connect to Windows Server
$(greenprint '9)') Reset Ubuntu Setting
$(redprint '10)') Repair Software/Reinstallation
$(redprint '11)') RemoveTemp
$(greenprint '12)') Repair Wi-fi
$(greenprint '13)') Allow Wifi for Standard User
$(greenprint '14)') Install Wifi Driver
$(greenprint '15)') Remove Unnecessary/Unwanted Software
$(greenprint '16)') HP printer & Scanner Driver
$(greenprint '17)') Barcode Printer Driver
$(greenprint '18)') Repair User
$(redprint '19)') Download Software
$(greenprint '20)') asi Update
$(redprint 'Exit)')
Please enter your choice : "
read -r opt

    case $opt in
        											 1)
            echo "you chose choice $REPLY which is $opt. Please Wait...!"
clear
# -Hostname information:
echo -e "\e[31;43m***** HOSTNAME INFORMATION *****\e[0m"
hostnamectl
echo ""
# -Mac Address information:
echo -e "\e[31;43m***** MAC Address INFORMATION *****\e[0m"
ip -o link show | cut -d " " -f 2,20
echo ""
# -System and Serial Number information:
echo -e "\e[31;43m***** SYSTEM AND SERIAL NUMBER INFORMATION *****\e[0m"
dmidecode -t system | head -15 | tail -8 | egrep --color='auto' -z "Serial Number"
echo ""
# -ME information:
echo -e "\e[31;43m***** MANAGE ENGINE SERVICE STATUS *****\e[0m"
service dcservice status | head -10 | egrep --color='auto' -z active
#service dcservice status |  head -15 | exit

# -Antivirus information:
echo -e "\e[31;43m*****KASPERSKY ANTIVIRUS SERVICE STATUS *****\e[0m"
service klnagent64 status | head -10 | egrep --color='auto' -z active
echo ""

# -Antivirus Activation information:
echo -e "\e[31;43m*****KASPERSKY ANTIVIRUS ACTIVATION - STATUS *****\e[0m"
kesl-control -L --query
echo ""
# -Free and used memory in the system:
echo -e "\e[31;43m ***** FREE AND USED MEMORY *****\e[0m"
free -m
echo ""
# -Top 5 processes as far as memory usage is concerned
echo -e "\e[31;43m***** TOP 5 MEMORY-CONSUMING PROCESSES *****\e[0m"
ps -eo %mem,%cpu,comm --sort=-%mem | head -n 6
echo ""

# -Top 5 processes as far as memory usage is concerned
echo -e "\e[31;43m***** Details of Current DNS Server  *****\e[0m"
systemd-resolve --status | grep -B 9 -A 6 "Current DNS Server"
# Check Logged In Users
who>/tmp/who
echo -e "\E[11;42m Logged In users :\e[0m" $tecreset && cat /tmp/who
echo ""
echo -e "\e[1;32mCreated by Ravindra Thakar (W84459) \e[0m"
exit
            ;;
        											 2)
         echo "you chose choice $REPLY which is $opt.Please Wait...!"
         # unset any variable which system may be using

# clear the screen
clear
unset tecreset os architecture kernelrelease internalip externalip nameserver loadaverage

while getopts iv name
do
    case $name in
      i)iopt=1;;
      v)vopt=1;;
      *)echo "Invalid arg";;
    esac
done

if [[ ! -z $iopt ]]
then
{
wd=$(pwd)
basename "$(test -L "$0" && readlink "$0" || echo "$0")" > /tmp/scriptname
scriptname=$(echo -e -n $wd/ && cat /tmp/scriptname)
su -c "cp $scriptname /usr/bin/monitor" root && echo "Congratulations! Script Installed, now run monitor Command" || echo "Installation failed"
}
fi

if [[ ! -z $vopt ]]
then
{
echo -e "tecmint_monitor version 0.1\nDesigned by Tecmint.com\nReleased Under Apache 2.0 License"
}
fi

if [[ $# -eq 0 ]]
then
{


# Define Variable tecreset
tecreset=$(tput sgr0)

# Check if connected to Internet or not
ping -c 1 google.com &> /dev/null && echo -e '\E[32m'"Internet: $tecreset Connected" || echo -e '\E[32m'"Internet: $tecreset Disconnected"

# Check OS Type
os=$(uname -o)
echo -e '\E[32m'"Operating System Type :" $tecreset $os

# Check OS Release Version and Name
cat /etc/os-release | grep 'NAME\|VERSION' | grep -v 'VERSION_ID' | grep -v 'PRETTY_NAME' > /tmp/osrelease
echo -n -e '\E[32m'"OS Name :" $tecreset  && cat /tmp/osrelease | grep -v "VERSION" | cut -f2 -d\"
echo -n -e '\E[32m'"OS Version :" $tecreset && cat /tmp/osrelease | grep -v "NAME" | cut -f2 -d\"

# Check Architecture
architecture=$(uname -m)
echo -e '\E[32m'"Architecture :" $tecreset $architecture

# Check Kernel Release
kernelrelease=$(uname -r)
echo -e '\E[32m'"Kernel Release :" $tecreset $kernelrelease

# Check hostname
echo -e '\E[32m'"Hostname :" $tecreset $HOSTNAME

# Check Internal IP
internalip=$(hostname -I)
echo -e '\E[32m'"Internal IP :" $tecreset $internalip

# Check External IP
externalip=$(curl -s ipecho.net/plain;echo)
echo -e '\E[32m'"External IP : $tecreset "$externalip

# Check DNS
nameservers=$(cat /etc/resolv.conf | sed '1 d' | awk '{print $2}')
echo -e '\E[32m'"Name Servers :" $tecreset $nameservers

# Check Logged In Users
who>/tmp/who
echo -e '\E[32m'"Logged In users :" $tecreset && cat /tmp/who

# Check RAM and SWAP Usages
free -h | grep -v + > /tmp/ramcache
echo -e '\E[32m'"Ram Usages :" $tecreset
cat /tmp/ramcache | grep -v "Swap"
echo -e '\E[32m'"Swap Usages :" $tecreset
cat /tmp/ramcache | grep -v "Mem"

# Check Disk Usages
df -h| grep 'Filesystem\|/dev/sda*' > /tmp/diskusage
echo -e '\E[32m'"Disk Usages :" $tecreset
cat /tmp/diskusage
# -File system disk space usage:
echo -e "\e[31;43m***** FILE SYSTEM DISK SPACE USAGE *****\e[0m"
df -h
echo ""
# Check Load Average
loadaverage=$(uptime | cut -d ':' -f 5-)
echo -e '\E[32m'"Load Average :" $tecreset $loadaverage

# Check System Uptime
tecuptime=$(uptime | awk '{print $3,$4}' | cut -f1 -d,)
echo -e '\E[32m'"System Uptime Days/(HH:MM) :" $tecreset $tecuptime
# -System uptime and load:
echo -e "\e[31;43m***** SYSTEM UPTIME AND LOAD *****\e[0m"
uptime
echo ""
# -Logged-in users:
echo -e "\e[31;43m***** CURRENTLY LOGGED-IN USERS *****\e[0m"
who
echo ""
# Unset Variables
unset tecreset os architecture kernelrelease internalip externalip nameserver loadaverage

# Remove Temporary Files
rm /tmp/osrelease /tmp/who /tmp/ramcache /tmp/diskusage
}
fi
shift $(($OPTIND -1))
 exit
        ;;
        											 3)
            echo "you chose choice $REPLY which is $opt."
#Author: Ravindra Thakar
#Assign existing hostname to $hostn
hostn=$(cat /etc/hostname)

#Display existing hostname
echo "Existing hostname is $hostn"

#Ask for new hostname $newhost
echo "Enter new hostname: "
read newhost

#change hostname in /etc/hosts & /etc/hostname
sudo sed -i "s/$hostn/$newhost/g" /etc/hosts
sudo sed -i "s/$hostn/$newhost/g" /etc/hostname

#display new hostname
echo "Your new hostname is $newhost"

read -p "Press y key to reboot or n for exit $foo? [yn]" answer
if [ $answer = y ] ; then
#Press a key to reboot
sudo reboot
 else
  exit
fi
#read -s -n 1 -p "Press any key to reboot"
#END
exit
            ;;
        											 4)
            echo "you chose choice $REPLY which is $opt.Please Wait...!"
#!/bin/bash
sudo apt remove anydesk -y
sudo apt purge anydesk firefox rhythmbox team -y
#sudo apt-get remove --purge libreoffice* -y
sudo apt-get clean -y
sudo apt-get remove fonts-opensymbol libreoffice libreoffice-\* openoffice.org-dtd-officedocument1.0 python\*-uno uno-libs3-\* ure ure-dbg -y
sudo apt-get remove --purge libreoffice-core -y
sudo apt-get remove libreoffice-core -y
sudo apt purge -y libreoffice*
sudo apt-get remove --purge -y libreoffice*
sudo apt purge aisleriot gnome-sudoku mahjongg ace-of-penguins gnomine gbrainy gnome-sushi gnome-taquin gnome-tetravex  gnome-robots gnome-chess lightsoff swell-foop quadrapassel -y
sudo apt-get autoremove -y
sudo apt autoremove -y
sudo apt update -y
sudo apt-get install build-essential net-tools -y
#sudo apt-get install libaio1 default-jdk openssh-server ssh libpango1.0-0 dpkg-dev libgtkglext1 -y
sudo apt update --fix-missing -y
sudo apt --fix-broken install -y
sudo apt list --upgradable -y
wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo apt-key add -
echo "deb http://deb.anydesk.com/ all main" | sudo tee /etc/apt/sources.list.d/anydesk-stable.list
sudo apt update
sudo dpkg -i anydesk*.deb
sudo apt install -f -y
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo dpkg -i wps*.deb
#sudo snap install wps-office
sudo apt-get install -f -y
chmod +x klnagent*.sh
./klnagent*.sh
sleep 5
/opt/kaspersky/klnagent64/bin/./klnagchk
sleep 5
sudo dpkg -i kesl_11.2.0-4528_amd64.deb
sleep 5
/opt/kaspersky/kesl/bin/kesl-setup.pl
sleep 5
yes Y | kesl-control -L --add-active-key BQFBG-K8SGC-W78VR-FD2FG 
sleep 5
#wget
tar -xvf barcodedriver-1.2.06_x86-64.tar.gz
tar -xvf LinuxSoftware_E1000_v4.2.1.x86_64.deb.tar.gz
cd barcodedriver-1.2.06
chmod +x install-driver uninstall-driver
./install-driver
cd ..
chmod +x setup.sh
#./setup.sh
#dpkg -i kodak*.deb
#dpkg -i lib*.deb
sudo apt update --fix-missing
sudo apt --fix-broken install
apt-get update 
cd /home/administrator/Desktop
wget https://delhivery-it-docs-cdn.delhivery.com/DesktopCentral_LinuxAgent.bin 
sleep 5 
wget https://delhivery-it-docs-cdn.delhivery.com/DMRootCA.crt 
sleep 5 
wget https://delhivery-it-docs-cdn.delhivery.com/DMRootCA-Server.crt 
sleep 5 
wget https://delhivery-it-docs-cdn.delhivery.com/serverinfo.json  
sleep 5 
chmod 777 DesktopCentral_LinuxAgent.bin
./DesktopCentral_LinuxAgent.bin
sleep 5
#sudo chmod -x /etc/update-motd.d/90-updates-available
sudo chmod -x /etc/update-motd.d/91-release-upgrade
#chmod +x Ubuntu\ \(1\).sh
#chmod +x Ubuntu.sh
#./Ubuntu\ \(1\).sh
#################################################################################################################
#echo "Stop Bluetooth"
#sudo systemctl disable bluetooth
#sudo systemctl stop bluetooth
#sudo rfkill block bluetooth
#sudo /etc/init.d/bluetooth stop
#echo "Bluetooth Disabled.!!"

#sudo mv /etc/init/bluetooth.conf /etc/init/bluetooth.conf.disabled
#echo "Bluetooth permanently disabled successfully.!!!"

#bluetooth re-enable
#sudo mv /etc/init/bluetooth.conf.disabled /etc/init/bluetooth.conf
#echo "Bluetooth re-enabled successfully.!!!"

#need display timeout setting and battary setting
#ssh install
#lpadmin -p printername -E -v socket://11.22.33.44 -m drv:///sample.drv/laserjet.ppd
# lpadmin -p printer1 -n /path/mynewHPppdfile.ppd
#wget https://download.anydesk.com/linux/anydesk_6.1.1-1_amd64.deb
#sudo dpkg -i anydesk*.deb
#wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -f -y
#https://www.cups.org/doc/admin.html
# Am i Root user?
if [ $(id -u) -eq 0 ]; then
username=delhivery
password=Welcome@123
	egrep "^$username" /etc/passwd >/dev/null
	if [ $? -eq 0 ]; then
		echo "$username exists!"
		exit 1
	else
		pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
		useradd -m -p "$pass" "$username"
        sudo adduser delhivery netdev
		[ $? -eq 0 ] && echo "User has been added to system!" || echo "Failed to add a user!"
	fi
else
	echo "Only root may add a user to the system."
	exit 2
fi

exit
              ;;
        											 5)
            echo "you chose choice $REPLY which is $opt.Please Wait...!"

  
            ;;
            
        											 6)
            echo "you chose choice $REPLY which is $opt. Please Wait...!"
           ###########################################################################################################################################
exit
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

exit
            ;;
        											 7)
            echo "you chose choice $REPLY which is $opt. Please Wait...!"
echo "Custom audit not built"
exit
            ;;
        											 8)
            echo "you chose choice $REPLY which is $opt. Please Wait...!" 
nohup gedit &>/dev/null &
exit

            ;;
        											 9)
            echo "you chose choice $REPLY which is $opt. Please Wait...!" 
sudo dconf reset -f /
exit
;;
        											 10)
            echo "you chose choice $REPLY which is $opt. Please Wait...!"
kill -9 -1

            ;;
        											 11)
            echo "you chose choice $REPLY which is $opt. Please Wait...!"

exit
            ;;
        											 12)
            echo "you chose choice $REPLY which is $opt. Please Wait...!"

echo "asking for a administrator password while connect to wifi in ubuntu- Ubutnu Admin System policy
Wifi not connecting, Wifi need admin password for connect, Wifi asking for administrative password, Wifi not working in ubuntu.
For ubuntu system : -
step 1 : Open Terminal.
step 2 : Login with sudo user.
setp 3 : Type the below command and [PRESS ENTER KEY].

gedit /usr/share/polkit-1/actions/org.freedesktop.NetworkManager.policy
Note : This  will open gedit network manager file.Do not delete any lines in this file.

step 4 : Copy below Command.

<allow_active>auth_admin_keep</allow_active>

step 5 : find the keyword using ctrl + f

step 6 :Replace with this lines



Step 7 : Save FIle with [ Ctrl + x ] & Exit.

Step 8 : Reboot the system is optional."

exit
            ;;
        											 13)
            echo "you chose choice $REPLY which is $opt. Please Wait...!"
ls /sys/class/net
echo "####################"
sudo lshw -C network
echo "####################"
sudo lshw -businfo
echo "lists information about devices on the USB bus/ USB Mini Wifi Information if Device Connected.!!"
echo "PCI (internal) device"
lspci -nnk | grep 0280 -A3
sudo lsusb -v
sudo adduser delhivery netdev
#ip a
                        echo "The wifi access privileges of standard users are changed successfully. Standard users are now able to connect to various wifi networks."
 exit           
            ;;
           
        											 14)
            echo "you chose choice $REPLY which is $opt. Please Wait...!"
apt-get update
apt-get install mokutil && mokutil --sb-state

apt-get install git build-essential linux-headers-$(uname -r) -y

apt-get install git -y
git clone https://github.com/lwfinger/rtw88.git
cd rtw88
make
make install

rm -v -R --interactive=never ~/rtw88

cd /etc/default/grub

#change GRUB_CMDLINE_LINUX_DEFAULT=“quiet splash” line as below

sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash i8042.nopnp=1 pci=nocrs"/g' /etc/default/grub 

sudo update-grub

init 6
 
            ;;
        											 15)
            echo "you chose choice $REPLY which is $opt. Please Wait...!"
            sudo apt-get purge -y firefox
            rm -rf ~/.mozilla
            rm -rf ~/.mozilla/firefox/
            sudo apt-get purge rhythmbox -y
		sudo apt-get purge -y teamviewer -y
		sudo apt-get purge -y rhythmbox firefox aisleriot gnome-sudoku mahjongg ace-of-penguins gnomine gbrainy gnome-sushi gnome-taquin gnome-tetravex  gnome-robots gnome-chess lightsoff swell-foop quadrapassel
		sudo apt-get remove --purge -y rhythmbox firefox aisleriot gnome-sudoku mahjongg ace-of-penguins gnomine gbrainy gnome-sushi gnome-taquin gnome-tetravex  gnome-robots gnome-chess lightsoff swell-foop quadrapassel
		sudo apt remove -y aisleriot
		sudo apt-get remove --purge -y libreoffice* thunderbird*
		sudo apt remove -y rhythmbox thunderbird* whatsapp telegram 
		sudo apt-get -y purge aisleriot gnome-sudoku mahjongg ace-of-penguins gnomine gbrainy
		sudo apt-get purge --auto-remove -y gnome-mahjongg
		sudo apt-get purge --auto-remove -y gnome-mines
		#sudo apt-get remove -y fonts-opensymbol libreoffice libreoffice-\* openoffice.org-dtd-officedocument1.0 python\*-uno uno-libs3-\* ure ure-dbg
		sudo apt purge aisleriot gnome-sudoku mahjongg ace-of-penguins gnomine gbrainy gnome-sushi gnome-taquin gnome-tetravex  gnome-robots gnome-chess lightsoff swell-foop quadrapassel 
		sudo apt purge gnome-2048 aisleriot atomix gnome-chess five-or-more hitori iagno gnome-klotski lightsoff gnome-mahjongg gnome-mines gnome-nibbles quadrapassel four-in-a-row gnome-robots gnome-sudoku swell-foop tali gnome-taquin gnome-tetravex -y & sudo apt autoremove -y
		sudo apt-get purge gnome-games-common gbrainy -y
		sudo apt-get remove --purge libreoffice-core -y
		sudo apt-get remove libreoffice-core -y
		sudo apt purge -y libreoffice*
		sudo apt-get clean -y
		sudo apt-get autoremove -y
		sudo apt autoremove -y
		sudo apt update -y
            exit           
            ;;
        											 16)
            echo "you chose choice $REPLY which is $opt. Please Wait...!"
	    sudo apt install apparmor-utils
sudo aa-disable /usr/share/hplip/plugin.py
hp-plugin
	    exit
            ;;
        											 17)
            echo "you chose choice $REPLY which is $opt. Please Wait...!"
tar -xvf barcodedriver-1.2.06_x86-64.tar.gz
tar -xvf barcodedriver*.tar.gz
tar -xvf LinuxSoftware_E1000_v4.2.1.x86_64.deb.tar.gz
cd barcodedriver-1.2.06
chmod +x install-driver uninstall-driver
./uninstall-driver
./install-driver
exit
            ;;
        											 18)
            echo "you chose choice $REPLY which is $opt. Please Wait...!"
sudo cat > /etc/ssh/sshd_config << EOF
# Package generated configuration file
# See the sshd_config(5) manpage for details
 
# What ports, IPs and protocols we listen for
Port 22
# Use these options to restrict which interfaces/protocols sshd will bind to
#ListenAddress ::
#ListenAddress 0.0.0.0
Protocol 2
# HostKeys for protocol version 2
HostKey /etc/ssh/ssh_host_rsa_key
HostKey /etc/ssh/ssh_host_dsa_key
HostKey /etc/ssh/ssh_host_ecdsa_key
HostKey /etc/ssh/ssh_host_ed25519_key
#Privilege Separation is turned on for security
UsePrivilegeSeparation yes
 
# Lifetime and size of ephemeral version 1 server key
KeyRegenerationInterval 3600
ServerKeyBits 1024
 
# Logging
SyslogFacility AUTH
LogLevel INFO
 
# Authentication:
LoginGraceTime 120
PermitRootLogin yes
StrictModes yes
 
RSAAuthentication yes
PubkeyAuthentication yes
#AuthorizedKeysFile %h/.ssh/authorized_keys
 
# Don't read the user's ~/.rhosts and ~/.shosts files
IgnoreRhosts yes
# For this to work you will also need host keys in /etc/ssh_known_hosts
RhostsRSAAuthentication no
# similar for protocol version 2
HostbasedAuthentication no
# Uncomment if you don't trust ~/.ssh/known_hosts for RhostsRSAAuthentication
#IgnoreUserKnownHosts yes
 
# To enable empty passwords, change to yes (NOT RECOMMENDED)
PermitEmptyPasswords no
 
# Change to yes to enable challenge-response passwords (beware issues with
# some PAM modules and threads)
ChallengeResponseAuthentication no
 
# Change to no to disable tunnelled clear text passwords
#PasswordAuthentication yes
 
# Kerberos options
#KerberosAuthentication no
#KerberosGetAFSToken no
#KerberosOrLocalPasswd yes
#KerberosTicketCleanup yes
 
# GSSAPI options
#GSSAPIAuthentication no
#GSSAPICleanupCredentials yes
 
X11Forwarding yes
X11DisplayOffset 10
PrintMotd no
PrintLastLog yes
TCPKeepAlive yes
#UseLogin no
 
#MaxStartups 10:30:60
#Banner /etc/issue.net
 
# Allow client to pass locale environment variables
AcceptEnv LANG LC_*
 
Subsystem sftp /usr/lib/openssh/sftp-server
 
# Set this to 'yes' to enable PAM authentication, account processing,
# and session processing. If this is enabled, PAM authentication will
# be allowed through the ChallengeResponseAuthentication and
# PasswordAuthentication.  Depending on your PAM configuration,
# PAM authentication via ChallengeResponseAuthentication may bypass
# the setting of "PermitRootLogin without-password".
# If you just want the PAM account and session checks to run without
# PAM authentication, then enable this but set PasswordAuthentication
# and ChallengeResponseAuthentication to 'no'.
UsePAM yes

EOF
sudo service ssh restart
exit
            ;;
       
        											 19)
            echo "you chose choice $REPLY which is $opt. Please Wait...!" 

echo "Please Enter a User ID Number : "
read uid

 if [ $(grep -w $uid) -n </etc/passwd ] ;
 then
    grep -w $uid /etc/passwd | cut -d ":" -f "1" | xargs echo "Welcome : "
else
    echo "user not found"
fi

exit
            ;;
        											 20)
            echo "you chose choice $REPLY which is $opt. Please Wait...!" 

#Plugin for checking if the SSH service is running

SERVICE='ssh'

if [ ps aux | grep -v grep | grep $SERVICE > /dev/null ];
then
        exit 0
else
        exit 1
fi
exit

            ;;
        "Logout")
            echo "you chose choice $REPLY which is $opt. Please Wait...!"

read -p "Press Y key to Reboot, N for Exit $foo - [y/n]" answer
if [ $answer = y ] ; then
#Press a key to reboot
ls
 else
  exit
fi

            ;;
        "PowerOff Machine")
            echo "you chose choice $REPLY which is $opt. Please Wait...!"
gnome-session-quit --logout --no-prompt
sudo shutdown -h 1
            ;;
        "Reboot Machine")
            echo "you chose choice $REPLY which is $opt. Please Wait...!"
sudo reboot
            ;;
        "Learn command")
            echo -e "\nTo open Open Office 4 from shell => /opt/openoffice4/program/./soffice.bin \n"
echo -e "To Open Oracle 10 g from Shell => sudo /etc/init.d/oracle-xe force-reload \nfirefox http://localhost:8181/apex \n"
echo -e "To Open phpmyadmin from Shell => firefox http://localhost/phpmyadmin \n"
echo -e "To Open Apache LocalHost from Shell => firefox http://localhost/yourwebsitename \n "
https://www.liveagent.com/templates/ticketing/
https://blog.happyfox.com/best-canned-response-templates-for-customer-support-emails/#Closing
https://www.jitbit.com/news/ticket-queue-management/
https://askubuntu.com/questions/1705/how-can-i-create-a-select-menu-in-a-shell-script
https://phoenixnap.com/kb/bash-case-statement
https://stackoverflow.com/questions/12614011/using-case-for-a-range-of-numbers-in-bash
https://linuxize.com/post/bash-case-statement/	
https://www.thegeekstuff.com/2010/07/bash-case-statement/
https://gist.github.com/waleedahmad/a5b17e73c7daebdd048f823c68d1f57a
https://www.tecmint.com/using-shell-script-to-automate-linux-system-maintenance-tasks/
https://linuxconfig.org/bash-scripting-tutorial

exit
      ;;
        "Quit")
            break
exit
exit
            ;;
        *) echo "invalid option $REPLY";;
    esac
    
}

mainmenu
#rdesktop -f ip
#press enter to connect
