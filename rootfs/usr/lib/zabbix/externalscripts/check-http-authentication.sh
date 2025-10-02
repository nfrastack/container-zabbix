#!/bin/bash
# SPDX-FileCopyrightText: © 2025 Nfrastack <code@nfrastack.com>
#
# SPDX-License-Identifier: MIT

# HTTP Check Script for websites that require authentication - Specifically LemonLDAP:NG Protected
# Dave Conroy <tiredofit@github> 2022-02-17
# Usage: http_cehck_authentication.sh <mode> <username> <password> <auth_url> <site_url> <string_to_check>"

###
authenticate() {
     headers=$(mktemp)
     authenticate_response=$(curl -sSL -D $headers \
                                       -H "Accept: application/json" \
                                       -d user="$1" \
                                       --data-urlencode password=$2 \
                                       $3 | jq .result)

     if [ "${authenticate_response}" = "1" ] ; then
          cookie=$(cat $headers | grep "set-cookie" | cut -d ';' -f 1 | cut -d : -f 2 | sed "s| ||g")
          lifetime=$(cat $headers | grep "set-cookie" | cut -d ';' -f 4 | cut -d = -f 2)
          echo $cookie > /tmp/.authinfo
          echo $lifetime >> /tmp/.authinfo
          rm -rf $headers
     else
          echo "** Unable to authenticate"
          rm -rf $headers
          exit 1
     fi
}

check_cookie_age() {
     ### Check to see if its over a day
     if [ "$(stat c %Y /tmp/.authinfo)" -le $(( `date +%s` - $(tail -n 1 /tmp/.authinfo) )) ]; then
       cookie_age="invalid"
     else
       cookie_age="valid"
     fi
}

###

if [ -z $1 ] || [ -z $2 ] || [ -z $3 ] || [ -z $4 ] || [ -z $5 ] ; then
   echo "## Website Checker | 2021-02-17 | <daveconroy@selfdesign.org>"
   echo "## Usage: $(basename $0) <mode> <username> <password> <auth_url> <site_url> <string_to_check_dependent_on_mode>"
   echo "##        Mode can either be 'response' or 'string' | 'string-insensitive' . When 'string' chosen you must fill in a string to search for"
   exit 1
fi

if [ -f "/tmp/.authinfo" ] ; then
     check_cookie_age
     if [ "${cookie_age}" = "invalid" ] ; then
        authenticate $2 $3 $4
     fi
else
     authenticate $2 $3 $4
fi

case "${1,,}" in
     "response" )
          response=$(curl -sSL --cookie $(head -n1 /tmp/.authinfo) --write-out %{http_code} --silent $5 --output /dev/null)
          echo $response
	    ;;
     "string" )
          if [ -z "$6" ] ; then
             echo "!! Need Search String"
             echo "!! Usage: $(basename $0) <mode> <username> <password> <auth_url> <site_url> <string_to_check>"
             exit 1
          fi

          if curl -sSL ${curl_header} --cookie $(head -n1 /tmp/.authinfo) $5 2>&1 | grep -q "$6" ; then
               echo "Available"
          else
               echo "Unavailable"
          fi
     ;;
     "string-insensitive" )
          if [ -z "$6" ] ; then
             echo "!! Need Search String"
             echo "!! Usage: $(basename $0) <mode> <username> <password> <auth_url> <site_url> <string_to_check>"
             exit 1
          fi

          if curl -sSL ${curl_header} --cookie $(head -n1 /tmp/.authinfo) $5 2>&1 | grep -i -q "$6" ; then
               echo "Available"
          else
               echo "Unavailable"
          fi
     ;;
      *)
             echo "!! Usage: $(basename $0) <mode> <username> <password> <auth_url> <site_url> <string_to_check>"
             exit 1
     ;;
esac
