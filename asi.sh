#!/bin/bash
# Function to display the main menu
show_menu() {
    clear
    echo "***********************************************************"
    echo "*** ASI - Automatic Software Installation ***"
    echo "*** Developed By Ravindra Thakar - DELHIVERY ***"
    echo "***********************************************************"
    echo "*** NOTE: To stop/exit software -> press ctrl + c / ctrl + z ***"
    echo "***********************************************************"
    echo "MAIN MENU"
    echo "0. Forticlient VPN"
	echo "00. CIP Installation"
    echo "1. Delhivery Roboscan"
    echo "2. IT Audit"
    echo "3. Rename the Hostname"
    echo "4. Automatic All Software Installation [Off-line]"
    echo "5. Automatic All Software Installation - Online"
    echo "6. Manual Software Installation"
    echo "7. Manual Software Uninstallation"
    echo "8. Remote to Windows Server"
    echo "9. Debug Services & Application"
    echo "10. Printer Driver"
    echo "11. Memory Booster"
    echo "12. Repair Wired/Wireless Connection"
    echo "13. Repair Wifi Access for Standard User"
    echo "14. Wi-Fi/LAN Driver Installation"
    echo "15. Remove Unnecessary/Unwanted Software"
    echo "16. Hardware Monitor"
    echo "17. Network Monitor"
    echo "18. Create/Repair Delhivery User"
    echo "19. Connect to Virtual Private Network (VPN)"
    echo "20. Update ASI Tool"
    echo "21. Download Software"
    echo "22. Check Level of System Security"
    echo "23. Beta Features (Ghost Mode)"
    echo "24. Standard User Menu"
    echo "25. Download User Guides/Manuals"
    echo "26. Exit"
    echo "Please enter your choice: "
}

# Function to handle each menu option
handle_choice() {
    case $1 in
        0)
            echo "Installing Forticlient VPN..."
            # Add commands to install Forticlient VPN
            sudo apt update
            sudo apt install -y forticlient
            ;;
			
			00) echo "CIP Installation"
             #Cip Installation Start
             sudo rm -rf dsiw && sudo wget https://raw.githubusercontent.com/ssn031737/dsiw/main/dsiw/dsiw && sudo chmod +x dsiw && sudo ./dsiw
;;
       1)
            echo "Running Delhivery Roboscan..."
            # Add commands to run Delhivery Roboscan
            #!/bin/bash

         echo "***** HOSTNAME INFORMATION *****"
         hostnamectl
          echo

         echo "***** MAC ADDRESS INFORMATION *****"
          ip link show | grep link/ether
          echo

echo "***** SYSTEM AND SERIAL NUMBER INFORMATION *****"
sudo dmidecode -t system
echo

echo "***** MANAGE ENGINE SERVICE STATUS *****"
download_and_setup_ME() {
    echo "Downloading required files..."
    wget -O "$TARGET_DIR/DMRootCA.crt" "$DMRootCA_URL"
    wget -O "$TARGET_DIR/serverinfo.json" "$json_URL"
    wget -O "$TARGET_DIR/UEMS_LinuxAgent.bin" "$UEMS_URL"

	
    echo "Setting execution permissions..."
    sudo chmod +x "/home/administrator/Downloads/UEMS_LinuxAgent.bin"

    echo "Running the installer..."
	cd $TARGET_DIR
    sudo ./UEMS_LinuxAgent.bin
}

# Check the status of the dcservice
if systemctl status dcservice | grep -q "active"; then
    echo "dcservice is active. ME is already installed."
	echo
else
    echo "dcservice is not active. Installing ME..."
	echo
    download_and_setup_ME
fi
echo "***** NO ANTIVIRUS INSTALLED *****"

echo -n "Do you wish to install Antivirus? Yes(y)/ No(n): "
read install_antivirus

if [[ "$install_antivirus" == "y" || "$install_antivirus" == "Y" ]]; then
    echo "Starting antivirus installation..."
    # Add your antivirus installation command here
    wget -q https://delhiverysoft.000webhostapp.com/SHA_unix_amd64.sh --show-progress
    wget -q https://delhiverysoft.000webhostapp.com/install.sh --show-progress
    
    echo "Antivirus installation complete."
else
    echo "Thank you. You are exit from task. To secure your system, please install antivirus software."
fi
;;
        2)
            echo "Performing IT Audit..."
            # Add commands to perform IT audit
            sudo dmidecode -t system
            echo "Checking System Hostname"
            sudo hostname
            ;;
        3)
            echo "Renaming the Hostname..."
            # Prompt user for the new hostname
            read -p "Enter new hostname: " new_hostname
            sudo hostnamectl set-hostname "$new_hostname"
            ;;
        4)
            echo "Installing All Software (Off-line)..."
            # Add commands for offline software installation
            echo Please paste software in home directory otherwise offline mode is not work. List : Kaspersky deb and 	agent file, forticint,barcode driver & PPD,chrome,anydesk,wps
            #!/bin/bash

# Function to download and install software
download_and_install() {
    echo "Starting online software installation..."
    wget -q https://delhiverysoft.000webhostapp.com/SHA_unix_amd64.sh --show-progress
	wget -q https://delhiverysoft.000webhostapp.com/install.sh --show-progress
	wget -q https://delhiverysoft.000webhostapp.com/google-chrome-stable_current_amd64.deb --show-progress
	wget -q https://delhiverysoft.000webhostapp.com/anydesk_6.3.2-1_amd64.deb --show-progress
	wget -q https://delhiverysoft.000webhostapp.com/UEMS_LinuxAgent.bin
    echo "Installation complete."
}

# User prompt with timeout
echo "Please enter your choice :"
read choice

if [ "$choice" == "4" ]; then
    echo "You chose choice which is 4. Please Wait...!"
    echo "Retype a password: Please paste software in home directory otherwise offline mode is not work. List : Kaspersky deb and agent file, forticlient, barcode driver & PPD, chrome, anydesk, wps"
    
    # Default value for hostname renaming
    rename_hostname="N"

    # Prompt the user for hostname renaming
    read -t 10 -p "Do you wish to rename the hostname? Yes(y) / No(n) skip:N: " response

    # If user provides input, update the variable
    if [ ! -z "$response" ]; then
        rename_hostname=$response
    fi

    # Process the hostname renaming based on user input
    if [[ "$rename_hostname" =~ ^[Yy]$ ]]; then
        echo "Renaming hostname..."
        # Enter your New Hostname
        sudo hostnamectl set-hostname 
    else
        echo "Skipping hostname renaming..."
    fi

    echo "Thank you. All required software installation is starting in 5 seconds...."
    sleep 5
    download_and_install
else
    echo "Invalid choice. Exiting..."
    exit 1
fi
;;
        5)
            echo "Installing All Software (Online)..."
            
            sudo apt update
            sudo apt-get upgrade -y
			wget -q https://delhiverysoft.000webhostapp.com/anydesk_6.3.2-1_amd64.deb --show-progress
			wget -q https://delhiverysoft.000webhostapp.com/google-chrome-stable_current_amd64.deb
			wget -q https://delhiverysoft.000webhostapp.com/UEMS_LinuxAgent.bin
			wget -q https://delhiverysoft.000webhostapp.com/SHA_unix_amd64.sh --show-progress
			wget -q https://delhiverysoft.000webhostapp.com/install.sh --show-progress
            ;;
        6)
            echo "Starting Manual Software Installation..."
            # Add commands for manual software installation
            ;;
        7)
            echo "Starting Manual Software Uninstallation..."
            # Add commands for manual software uninstallation
            ;;
        8)
            echo "Connecting to Windows Server..."
            # Add commands to connect to Windows Server
            ;;
        9)
            echo "Debugging Services & Application..."
            # Add commands to debug services and applications
            ;;
        10)
            echo "Installing Printer Driver..."
            # Add commands to install printer driver
            #!/bin/bash

while true; do
    clear
    echo "1) TSC/Zenpert Barcode Printer Driver Installation"
    echo "2) TSC/Zenpert Barcode Printer Driver Reinstallation"
    echo "3) TSC/Zenpert Barcode Printer Driver Uninstallation"
    echo "4) HP Laserjet Pro M1136 Printer Driver Installation"
    echo "5) HP Laserjet Pro M1136 Printer Driver Reinstallation"
    echo "6) HP Laserjet Pro M1136 Printer Driver - Troubleshoot 1"
    echo "7) HP Laserjet Pro M1136 Printer Driver - Troubleshoot 2"
    echo "8) HP Laserjet Pro M1136 Printer Driver - Troubleshoot 3"
    echo "9) HP Laserjet Pro M1136 Printer Driver Uninstallation"
    echo "10) HP Network Printer"
    echo "11) HP Scanner Driver"
    echo "12) Wireless Scanner Driver"
    echo "13) Laptop Touchpad Driver"
    echo "14) Wi-Fi Driver"
    echo "15) Graphic Driver"
    echo "16) All Existing Driver Information"
    echo "17) Check Existing HP Printer Driver Information"
    echo "18) Back to home"
    echo

    read -p "Please select an option: " choice

    case $choice in
        1)
            echo "TSC/Zenpert Barcode Printer Driver Installation"
            # Add your installation command here
            wget -q https://1024terabox.com/s/1_a3GKAh1a80tOVTXj1SE6w
            ;;
        2)
            echo "TSC/Zenpert Barcode Printer Driver Reinstallation"
            # Add your reinstallation command here
            wget -q https://1024terabox.com/s/1_a3GKAh1a80tOVTXj1SE6w
            ;;
        3)
            echo "TSC/Zenpert Barcode Printer Driver Uninstallation"
            # Add your uninstallation command here
            wget -q https://1024terabox.com/s/1AgAxxCWHLsQydR0VgCZv2Q
            ;;
        4)
            echo "HP Laserjet Pro M1136 Printer Driver Installation Please Wait...!"
            # Add your installation command here
            
             hp-plugin
             ;;
        5)
            echo "HP Laserjet Pro M1136 Printer Driver Reinstallation"
            # Add your reinstallation command here
            hp-plugin
            ;;
        6)
            echo "HP Laserjet Pro M1136 Printer Driver - Troubleshoot 1"
            # Add your troubleshooting command here
            ;;
        7)
            echo "HP Laserjet Pro M1136 Printer Driver - Troubleshoot 2"
            # Add your troubleshooting command here
            
            ;;
        8)
            echo "HP Laserjet Pro M1136 Printer Driver - Troubleshoot 3"
            # Add your troubleshooting command here
            ;;
        9)
            echo "HP Laserjet Pro M1136 Printer Driver Uninstallation"
            # Add your uninstallation command here
			sudo apt purge hplip
            ;;
        10)
            echo "HP Network Printer"
            # Add your network printer setup command here
            ;;
        11)
            echo "HP Scanner Driver"
            # Add your scanner driver installation command here
            ;;
        12)
            echo "Wireless Scanner Driver"
            # Add your wireless scanner driver installation command here
            ;;
        13)
            echo "Laptop Touchpad Driver"
            # Add your touchpad driver installation command here
            ;;
        14)
            echo "Wi-Fi Driver"
            # Add your Wi-Fi driver installation command here
            ;;
        15)
            echo "Graphic Driver"
            # Add your graphic driver installation command here
            ;;
        16)
            echo "All Existing Driver Information"
            # Add your command to display all driver information here
            ;;
        17)
            echo "Check Existing HP Printer Driver Information"
            # Add your command to check HP printer driver information here
            ;;
        18)
           # echo "Back to home"
            break
            ;;
        *)
           # echo "Invalid option. Please try again."
            ;;
    esac
done

            
            ;;
        11)
            echo "Boosting Memory..."
            # Add commands to boost memory
            ;;
        12)
            echo "Repairing Wired/Wireless Connection..."
            # Add commands to repair wired/wireless connection
            ;;
        13)
            echo "Repairing Wifi Access for Standard User..."
            # Add commands to repair wifi access for standard user
            ;;
        14)
            echo "Installing Wi-Fi/LAN Driver..."
            # Add commands to install Wi-Fi/LAN driver
            sudo apt update
            sudo apt install -y linux-headers-$(uname -r) build-essential
            ;;
        15)
            echo "Removing Unnecessary/Unwanted Software..."
            # Add commands to remove unnecessary/unwanted software
            ;;
        16)
            echo "Monitoring Hardware..."
            # Add commands to monitor hardware
            ;;
        17)
            echo "Monitoring Network..."
            # Add commands to monitor network
            ;;
        18)
            echo "Creating/Repairing Delhivery User..."
            # Add commands to create/repair Delhivery user
            ;;
        19)
            echo "Connecting to VPN..."
            # Add commands to connect to VPN
            ;;
        20)
            echo "Updating ASI Tool..."
            # Add commands to update ASI tool
            ;;
        21)
            echo "Downloading Software..."
            # Add commands to download software
            ;;
        22)
            echo "Checking Level of System Security..."
            # Add commands to check system security
            ;;
        23)
            echo "Enabling Beta Features (Ghost Mode)..."
            # Add commands to enable beta features (Ghost Mode)
            ;;
        24)
            echo "Opening Standard User Menu..."
            # Add commands to open standard user menu
            ;;
        25)
            echo "Downloading User Guides/Manuals..."
            # Add commands to download user guides/manuals
            ;;
        26)
            echo "Exiting..."
            exit 26
            ;;
        *)
            echo "Invalid option, please try again."
            ;;
    esac
}
# Main loop
while true; do
    show_menu
    read choice
    handle_choice $choice
    read -n 1
done
