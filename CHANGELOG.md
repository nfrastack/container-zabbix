## 3.4.99 2025-10-02 <dave at tiredofit dot ca>

Add EOL Notice and deprecate image


## 3.4.11 2025-07-30 <dave at tiredofit dot ca>

   ### Added
      - Zabbix 7.4.1


## 3.4.10 2025-07-02 <dave at tiredofit dot ca>

   ### Changed
      - Swap PCRE for PCRE2


## 3.4.9 2025-07-02 <dave at tiredofit dot ca>

   ### Added
      - Zabbix 7.4.0


## 3.4.8 2025-06-27 <dave at tiredofit dot ca>

   ### Added
      - Zabbix 7.2.10


## 3.4.7 2025-06-20 <dave at tiredofit dot ca>

   ### Added
      - Zabbix 7.2.9


## 3.4.6 2025-06-18 <dave at tiredofit dot ca>

   ### Added
      - Zabbix 7.2.8


## 3.4.5 2025-05-20 <dave at tiredofit dot ca>

   ### Added
      - Pin to tiredofit/nginx-php-fpm:7.7.19
      - Zabbix 7.2.7


## 3.4.4 2025-04-30 <fermion2020@github>

   ### Changed
      - Fix Zabbix PSK Path autogeneration


## 3.4.3 2025-04-24 <dave at tiredofit dot ca>

   ### Changed
      - Readd ZABBIX_PROXY_TLS_CONNECT variable to work


## 3.4.2 2025-04-24 <dave at tiredofit dot ca>

   ### Added
      - Zabbix 7.2.6

   ### Changed
      - Rework functions to only write to configuration items if variable is set


## 3.4.1 2025-04-17 <dave at tiredofit dot ca>

   ### Changed
      - Downgrade to 7.2.5


## 3.4.0 2025-04-17 <dave at tiredofit dot ca>

   ### Added
      - Zabbix 7.2.6

   ### Changed
      - Rework Zabbix Proxy options and add variables for TLS and VAULT
      - Rename old Proxy variables of ZABBIX_PROXY_ENCRYPT_ > ZABBIX_PROXY_TLS


## 3.3.9 2025-03-31 <dave at tiredofit dot ca>

   ### Added
      - Zabbix 7.2.5


## 3.3.8 2025-02-25 <dave at tiredofit dot ca>

   ### Added
      - Zabbix 7.2.4


## 3.3.7 2025-01-28 <dave at tiredofit dot ca>

   ### Changed
      - Restore building Zabbix Proxy


## 3.3.6 2025-01-28 <dave at tiredofit dot ca>

   ### Added
      - Switch to PHP 8.3 for WebUI
      - Zabbix 7.2.3
      - Start building Zabbix Agent and Agent 2 overtop of image to account for any version differences


## 3.3.5 2024-10-22 <dave at tiredofit dot ca>

   ### Added
      - Zabbix 7.0.5
      - pin to tiredofit/nginx-php-fpm:7.7-13


## 3.3.4 2024-09-25 <dave at tiredofit dot ca>

   ### Added
      - Zabbix 7.0.4
      - Pin to tiredofit/nginx-php-fpm:8.2-alpine-7.7.9


## 3.3.3 2024-08-19 <dave at tiredofit dot ca>

   ### Added
      - Zabbix 7.0.3


## 3.3.2 2024-07-29 <dave at tiredofit dot ca>

   ### Added
      - Zabbix 7.0.2


## 3.3.1 2024-07-04 <dave at tiredofit dot ca>

   ### Added
      - Add linux-headers to build deps


## 3.3.0 2024-06-04 <dave at tiredofit dot ca>

   ### Added
      - Zabbix 7.0.0


## 3.2.7 2024-03-25 <dave at tiredofit dot ca>

   ### Added
      - Zabbix 6.4.13


## 3.2.6 2024-02-07 <dave at tiredofit dot ca>

   ### Added
      - Zabbix 6.4.11


## 3.2.5 2023-11-30 <dave at tiredofit dot ca>

   ### Added
      - Zabbix 6.4.9


## 3.2.4 2023-09-26 <dave at tiredofit dot ca>

   ### Added
      - Zabbix 6.4.7


## 3.2.3 2023-08-22 <dave at tiredofit dot ca>

   ### Added
      - Zabbix 6.4.6


## 3.2.2 2023-06-28 <dave at tiredofit dot ca>

   ### Added
      - Zabbix 6.4.4


## 3.2.1 2023-05-31 <dave at tiredofit dot ca>

   ### Added
      - Zabbix 6.4.3


## 3.2.0 2023-04-26 <dave at tiredofit dot ca>

   ### Added
      - Introduce support for '_FILE' environment variables


## 3.1.27 2023-04-25 <dave at tiredofit dot ca>

   ### Added
      - Zabbix 6.4.2


## 3.1.26 2023-04-02 <dave at tiredofit dot ca>

   ### Added
      - Zabbix 6.4.1


## 3.1.25 2023-03-07 <dave at tiredofit dot ca>

   ### Added
      - Zabbix 6.4.0
      - PHP 8.2 for Web Interface


## 3.1.24 2022-12-14 <dave at tiredofit dot ca>

   ### Added
      - Zabbix 6.2.6

   ### Changed
      - Refactor Dockerfile


## 3.1.23 2022-11-21 <dave at tiredofit dot ca>

   ### Added
      - Zabbix 6.2.4


## 3.1.22 2022-10-05 <dave at tiredofit dot ca>

   ### Changed
      - Migrate legacy nginx configuration


## 3.1.21 2022-10-04 <dave at tiredofit dot ca>

   ### Added
      - Zabbix 6.2.3

   ### Changed
      - Change the way Zabbix repo is cloned in Dockerfile


## 3.1.20 2022-08-30 <dave at tiredofit dot ca>

   ### Added
      - Zabbix 6.2.2


## 3.1.19 2022-08-17 <dave at tiredofit dot ca>

   ### Changed
      - Switch to using exec for launching processes


## 3.1.18 2022-07-27 <dave at tiredofit dot ca>

   ### Changed
      - Minor case cleanup for environment variables
      - Change the way Zabbix Proxy parses Hostnames and Ports

   ### Reverted
      - Remove Zabbix History Pollers


## 3.1.17 2022-07-26 <dave at tiredofit dot ca>

   ### Added
      - Zabbix 6.2.1


## 3.1.16 2022-07-07 <dave at tiredofit dot ca>

   ### Added
      - Zabbix 6.2.0


## 3.1.15 2022-07-07 <dave at tiredofit dot ca>

   ### Changed
      - Modernize Nginx configuration directives


## 3.1.14 2022-06-29 <dave at tiredofit dot ca>

   ### Added
      - Zabbix 6.0.6


## 3.1.13 2022-06-23 <dave at tiredofit dot ca>

   ### Changed
      - Repush of 3.1.12


## 3.1.12 2022-06-23 <dave at tiredofit dot ca>

   ### Added
      - Support tiredofit/nginx:6.0.0 and tiredofit/nginx-php-fpm:7.0.0 changes


## 3.1.11 2022-05-31 <dave at tiredofit dot ca>

   ### Added
      - Zabbix 6.0.5


## 3.1.10 2022-05-03 <dave at tiredofit dot ca>

   ### Added
      - Zabbix 6.0.4


## 3.1.9 2022-04-06 <dave at tiredofit dot ca>

   ### Added
      - Zabbix 6.0.3


## 3.1.8 2022-03-16 <dave at tiredofit dot ca>

   ### Added
      - Zabbix 6.0.2


## 3.1.7 2022-03-01 <dave at tiredofit dot ca>

   ### Added
      - Zabbix 6.0.1


## 3.1.6 2022-02-18 <dave at tiredofit dot ca>

   ### Added
      - Addd check-http-authentication.sh script for HTTP checks requiring a dynamic session/cookie


## 3.1.5 2022-02-15 <dave at tiredofit dot ca>

   ### Changed
      - Patchup for previous release


## 3.1.4 2022-02-15 <dave at tiredofit dot ca>

   ### Added
      - Add ability for Zabbix 6.0 server to run on unsupported DBs


## 3.1.3 2022-02-14 <dave at tiredofit dot ca>

   ### Added
      - Zabbix 6.0


## 3.1.2 2022-02-10 <dave at tiredofit dot ca>

   ### Changed
      - Update to support upstream image changes


## 3.1.1 2021-12-31 <dave at tiredofit dot ca>

   ### Changed
      - Tweak SSL Certificate expiry script


## 3.1.0 2021-12-28 <dave at tiredofit dot ca>

   ### Added
      - Add Zabbix Web service configuration


## 3.0.10 2021-12-27 <dave at tiredofit dot ca>

   ### Added
      - Zabbix 5.4.9


## 3.0.9 2021-12-22 <dave at tiredofit dot ca>

   ### Changed
      - Fix for broken brace


## 3.0.8 2021-12-22 <dave at tiredofit dot ca>

   ### Changed
      - Adjust check-ssl-expiry.sh bash script


## 3.0.7 2021-12-10 <dave at tiredofit dot ca>

   ### Changed
      - Additional fix for autoregister templates for proxy and server mode


## 3.0.6 2021-12-07 <dave at tiredofit dot ca>

   ### Changed
      - Don't Auto register Nginx or PHP templates if Server or Proxy


## 3.0.5 2021-12-07 <dave at tiredofit dot ca>

   ### Added
      - Add Zabbix autoregistration support for templates


## 3.0.4 2021-12-01 <dave at tiredofit dot ca>

   ### Added
      - Add SSO_SETTINGS variable


## 3.0.3 2021-11-29 <dave at tiredofit dot ca>

   ### Added
      - Zabbix 5.4.8


## 3.0.2 2021-10-28 <dave at tiredofit dot ca>

   ### Added
      - Zabbix 5.4.7


## 3.0.1 2021-10-17 <dave at tiredofit dot ca>

   ### Added
      - Zabbix 5.4.5


## 3.0.0 2021-07-25 <dave at tiredofit dot ca>

   ### Added
      - Omni Image - Contains Agent, Proxy, Server, and Web Interface all in one selectable by ZABBIX_MODE environment variable
      - More options for Zabbix Proxy
      - More options for Zabbix Agent
      - PHP 8.0 For Web Interface
      - Postgresql for Server required, SQLITE3 for Proxy

## 2.8.0 2021-07-21 <dave at tiredofit dot ca>

   ### Added
      - Alpine 3.14 base


## 2.7.1 2020-11-14 <dave at tiredofit dot ca>

   ### Added
      - Switch to Whois instead of Jwhois


## 2.7 2018-11-11 <dave at tiredofit dot ca>

* Revert back to Alpine 3.8 due to poor 4.0.1 upgrades

## 2.6 2018-10-21 <dave at tiredofit dot ca>

* Fixup of Startup script to set proper permissions

## 2.5 2018-02-02 <dave at tiredofit dot ca>

* Fix SSL Cert Script

## 2.4 2018-02-01 <dave at tiredofit dot ca>

* Add jwhois

## 2.3 2018-01-29 <dave at tiredofit dot ca>

* Use /assets/externalscripts + /assets/alertscripts for injections
* Add Check SSL Certificate + Check Domain Name Expiry scripts

## 2.2 2018-01-29 <dave at tiredofit dot ca>

* Add Nmap
* Add iputils
* Add Python3

## 2.1 2018-01-27 <dave at tiredofit dot ca>

* Add Python2, and openssl for extscripts

## 2.0 2018-01-27 <dave at tiredofit dot ca>

* Full rewrite - integrate Zabbix Agent inside

## 1.2 2018-01-27 <dave at tiredofit dot ca>

* Version Bump

## 1.1 2017-08-17 <dave at tiredofit dot ca>

* Version Bump

## 1.0 2017-08-17 <dave at tiredofit dot ca>

* Initial Release - Based off Official zabbix/zabbix-proxy-sqlite3:alpine-latest
* Python pyopenssl Added

