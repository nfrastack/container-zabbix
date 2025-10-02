#!/bin/bash
# SPDX-FileCopyrightText: © 2025 Nfrastack <code@nfrastack.com>
#
# SPDX-License-Identifier: MIT

## Get days left before certificate expires
## Author: Dave Conroy <tiredofit at github>

if [[ "$1" == *"-app" ]] ; then
   SERVER=$(echo $1 | sed "s|-app||g" | sed "s|-|.|g" )
else
   SERVER=$1
fi
echo "$(date) $1" >> /tmp/ssloutput

### Set Defaults
PORT=${2:-443}
TIMEOUT=10
set -x
cert_data="$(/usr/bin/timeout $TIMEOUT /usr/bin/openssl s_client -host $SERVER -port $PORT -servername $SERVER -showcerts < /dev/null 2>/dev/null | sed -n '/BEGIN CERTIFICATE/,/END CERT/p' | openssl x509 -enddate -noout 2>/dev/null | sed -e 's/^.*\=//')"

if [ -n "$cert_data" ] ; then
	end_date_seconds=$(date "+%s" --date "${cert_data// GMT/}")
	now_seconds=$(date "+%s")
	DAYS=$((($end_date_seconds-$now_seconds)/24/3600))
	echo $DAYS
else
	exit 124
fi
