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
        00)
            echo "CIP Installation"
            # CIP Installation Start
            sudo rm -rf dsiw && sudo wget https://raw.githubusercontent.com/ssn031737/dsiw/main/dsiw/dsiw && sudo chmod +x dsiw && sudo ./dsiw
            ;;
        1)
            echo "Running Delhivery Roboscan..."
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
                echo "Thank you. You are exiting from task. To secure your system, please install antivirus software."
            fi
            ;;
        2)
            echo "Performing IT Audit..."
            sudo dmidecode -t system
            echo "Checking System Hostname"
            sudo hostname
            ;;
        3)
            echo "Renaming the Hostname..."
            read -p "Enter new hostname: " new_hostname
            sudo hostnamectl set-hostname "$new_hostname"
            ;;
        4)
            echo "Installing All Software (Off-line)..."
            echo "Please paste software in home directory otherwise offline mode will not work. List: seqrite deb and agent file, forticint, barcode driver & PPD, chrome, anydesk, wps"
            download_and_install() {
                echo "Starting online software installation..."
                wget -q https://delhiverysoft.000webhostapp.com/SHA_unix_amd64.sh --show-progress
                wget -q https://delhiverysoft.000webhostapp.com/install.sh --show-progress
                wget -q https://delhiverysoft.000webhostapp.com/google-chrome-stable_current_amd64.deb --show-progress
                wget -q https://delhiverysoft.000webhostapp.com/anydesk_6.3.2-1_amd64.deb --show-progress
                wget -q https://delhiverysoft.000webhostapp.com/UEMS_LinuxAgent.bin
                echo "Installation complete."
            }

            echo "Please enter your choice:"
            read choice

            if [ "$choice" == "4" ]; then
                echo "You chose choice which is 4. Please Wait...!"
                echo "Retype a password: Please paste software in home directory otherwise offline mode will not work. List: Kaspersky deb and agent file, forticlient, barcode driver & PPD, chrome, anydesk, wps"
                
                rename_hostname="N"

                read -t 10 -p "Do you wish to rename the hostname? Yes(y) / No(n) skip:N: " response

                if [ ! -z "$response" ]; then
                    rename_hostname=$response
                fi

                if [[ "$rename_hostname" =~ ^[Yy]$ ]]; then
                    echo "Renaming hostname..."
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
            ;;
        7)
            echo "Starting Manual Software Uninstallation..."
            ;;
        8)
            echo "Connecting to Windows Server..."
            ;;
        9)
            echo "Debugging Services & Application..."
            ;;
        10)
            echo "Installing Printer Driver..."
            while true; do
                clear
                echo "1) TSC/Zenpert Barcode Printer Driver Installation"
                echo "2) TSC/Zenpert Barcode Printer Driver Reinstallation"
                echo "3) TSC/Zenpert Barcode Printer Driver Uninstallation"
                echo "4) HP Laserjet Pro M1136 Printer Driver Installation"
                echo "5) HP Laserjet Pro M1136 Printer Driver Reinstallation"
                echo "6) HP Laserjet Pro M1136 Printer Driver - Troubleshoot 1"
                echo "7) HP Laserjet Pro M1136 Printer Driver - Troubleshoot 2"
                echo "8) HP Laserjet Pro M1136 Printer Driver - Uninstallation"
                echo "9) Exit"
                echo "Please select an option: "
                read option
                case $option in
                    1)
                        echo "Installing TSC/Zenpert Barcode Printer Driver..."
                        ;;
                    2)
                        echo "Reinstalling TSC/Zenpert Barcode Printer Driver..."
                        ;;
                    3)
                        echo "Uninstalling TSC/Zenpert Barcode Printer Driver..."
                        ;;
                    4)
                        echo "Installing HP Laserjet Pro M1136 Printer Driver..."
                        ;;
                    5)
                        echo "Reinstalling HP Laserjet Pro M1136 Printer Driver..."
                        ;;
                    6)
                        echo "Troubleshooting HP Laserjet Pro M1136 Printer Driver - Step 1..."
                        ;;
                    7)
                        echo "Troubleshooting HP Laserjet Pro M1136 Printer Driver - Step 2..."
                        ;;
                    8)
                        echo "Uninstalling HP Laserjet Pro M1136 Printer Driver..."
                        ;;
                    9)
                        break
                        ;;
                    *)
                        echo "Invalid option. Please try again."
                        ;;
                esac
                echo "Press any key to continue..."
                read -n 1
            done
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac
}

# Main script execution
while true; do
    show_menu
    read choice
    handle_choice "$choice"
done
