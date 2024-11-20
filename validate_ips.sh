#!/bin/bash

validate_ip() {
	local hostname=$1
	local ip=$2
	local dns_server=$3

	nslookup "$hostname" "$dns_server" | grep -q "$ip"  && echo  "Valid: $hostname -> $ip" || echo "Invalid :
 $hostname -> $ip"

}


while read -r line; do
	ip=$(echo "$line" | awk '{print $1}')
	hostname=$(echo "$line" | awk '{print $2}')
	validate_ip "$hostname" "$ip" "8.8.8.8" 
done < /etc/hosts


