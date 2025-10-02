#!/bin/bash
# SPDX-FileCopyrightText: © 2025 Nfrastack <code@nfrastack.com>
#
# SPDX-License-Identifier: MIT

## Get Days left of Domain Name registration
## Author: Dave Conroy <tiredofit at github>

domain=$1

if [ -z $1 ];then
	echo "Usage : $0 <domain name>"
	exit 1;
fi

expiration=$(whois ${domain} | grep -e -i 'Expiry Date' | grep -oE '[0-9]{4}-[0-9]{2}-[0-9]{2}|[0-9]{4}\/[0-9]{2}\/[0-9]{2}')
expirationseconds=$(date --date="${expiration//\//\-}" +%s)
today=$(date +"%s")
diff=$(($expirationseconds-$today))
daysleft=$(($diff/86400))
echo $daysleft
