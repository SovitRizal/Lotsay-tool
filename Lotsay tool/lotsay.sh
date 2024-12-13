#!/bin/bash

# Set terminal colors and clear the screen
BS=$'\b'  # Backspace character for clearing the line
clear

# Banner function (centered)
banner() {
    # Get terminal width
    term_width=$(tput cols)
    # Banner lines
    lines=(
        "|               |"
        "|        _ \    __|    __|    _\` |   |   |        "
        "|       (   |   |    \__ \   (   |   |   |        "
        "_____|  \___/   \__|  ____/  \__,_|  \__, |        "
        "                                     ____/          "
    )
    
    # Print each line centered
    for line in "${lines[@]}"; do
        # Calculate padding to center the line
        padding=$(( (term_width - ${#line}) / 2 ))
        printf "%*s%s\n" $padding "" "$line"
    done
}

# Main menu
while true; do
    # Display the banner
    banner
    
    # Display the menu with bright green text
    echo ""
    echo -e "\033[38;2;0;255;0m        Lotsay"
    echo -e "\033[38;2;0;255;0m        |"
    echo -e "\033[38;2;0;255;0m        |"
    echo -e "\033[38;2;0;255;0m        |"
    echo -e "\033[38;2;0;255;0m        ----------> 1 Nmap (For Network Scanning)\033[0m"
    echo -e "\033[38;2;0;255;0m        ----------> 2 Wireshark (For Network Analyzing)\033[0m"
    echo -e "\033[38;2;0;255;0m        ----------> 3 Sublist3r (For Subdomain Finder)\033[0m"
    echo -e "\033[38;2;0;255;0m        ----------> 4 ZPhisher (For Phishing Tool)\033[0m"
    
    # Prompt for user input
    read -p "        ======== " input

    # Launch corresponding application
    case $input in
        1) 
            # Launch Nmap (Network Scanner)
            echo "Launching Nmap..."
            read -p "Enter the target IP address or hostname: " target
            nmap "$target"
            ;;
        2)
            # Launch Wireshark (Network Analyzer)
            echo "Launching Wireshark..."
            wireshark &
            ;;
        3)
            # Launch Sublist3r (Subdomain Finder)
            echo "Launching Subdomain Finder (Sublist3r)..."
            read -p "Enter the domain to search for subdomains: " domain
            python3 Sublist3r/sublist3r.py -d "$domain"
            ;;
        4)
            # Launch ZPhisher (Phishing Tool)
            echo "Launching ZPhisher..."
            cd zphisher
            ./zphisher.sh
            ;;
        *)
            echo "Invalid option, try again."
            ;;
    esac
done
