#!/bin/bash

# Function to display colored text
color_text() {
    echo -e "\e[$1m$2\e[0m"
}

# Function to generate random IPv4 and IPv6 addresses
generate_random_dns() {
    ipv4=$(shuf -i 1-255 -n 4 | tr '\n' '.' | sed 's/\.$//')
    ipv6=$(printf '2001:db8:%x:%x:%x:%x:%x:%x:%x:%x\n' $(shuf -i 0-65535 -n 8))
    echo "DNS IPv4: $ipv4"
    echo "DNS IPv6: $ipv6"
}

# Password protection
read -sp "Enter password: " password
echo ""
if [[ "$password" != "Sohrab" ]]; then
    color_text 31 "Incorrect password!"
    exit 1
fi

# List of available servers
servers=("UAE" "Turkey" "Germany" "France" "Afghanistan" "Iran")

# Choose server
color_text 34 "Please select a server by number:"
for i in "${!servers[@]}"; do
    color_text 34 "$((i+1)). ${servers[i]}"
done

read -p "Server number: " server_choice

# Choose IP
color_text 31 "Please select an IP by number:"
read -p "IP number: " ip_choice

# Ask about headshot enhancement
color_text 34 "Do you want the DNS to be headshot enhanced? (yes/no)"
read -p "Answer: " headshot_enhanced

# Generate and display DNS
color_text 33 "Results:"
dns_output=$(generate_random_dns)

# Heart shape output with dedication
echo -e "\n\n"
echo -e "\e[31m    *     *   \e[0m"
echo -e "\e[31m  * * \e[0m"
echo -e "\e[31m * \e[0m"
echo -e "\e[31m  ***  \e[0m"
echo -e "\e[31m    ***    \e[0m"
echo -e "\e[31m      ***      \e[0m"
echo -e "\e[31m        ***        \e[0m"
echo -e "\e[31m          ***          \e[0m"
echo -e "\e[31m           *           \e[0m"
echo -e "\e[33mDedicated to my good friend Kiaresh Jan\e[0m"
echo -e "\n"
color_text 33 "$dns_output"
