#!/bin/bash

if [ "$(id -u)" != "0" ]; then
   echo -e "\e[1;31mYou have to run this script with root permissions.\e[0m"
   exit 1
fi

# Variable for PATHS
piholeDir=/var/www/html/admin

while true; do
    read -p "Create a backup of the current files? (Y/n): " yn
    case $yn in
        [Yy]|""* ) 
				# Backup of all changed files...
				cp -f $piholeDir/style/vendor/AdminLTE.min.css $piholeDir/style/vendor/AdminLTE.min.css.orig
				cp -f $piholeDir/style/vendor/skin-blue.min.css $piholeDir/style/vendor/skin-blue.min.css.orig
				cp -f $piholeDir/scripts/pi-hole/js/index.js $piholeDir/scripts/pi-hole/js/index.js.orig
				cp -f $piholeDir/scripts/pi-hole/js/auditlog.js $piholeDir/scripts/pi-hole/js/auditlog.js.orig
				cp -f $piholeDir/scripts/pi-hole/js/network.js $piholeDir/scripts/pi-hole/js/network.js.orig
				cp -f $piholeDir/scripts/pi-hole/js/queries.js $piholeDir/scripts/pi-hole/js/queries.js.orig
				cp -f $piholeDir/scripts/pi-hole/js/db_queries.js $piholeDir/scripts/pi-hole/js/db_queries.js.orig
				cp -f $piholeDir/scripts/pi-hole/php/queryads.php $piholeDir/scripts/pi-hole/php/queryads.php.orig
				cp -f $piholeDir/index.php $piholeDir/index.php.orig
				cp -f $piholeDir/network.php $piholeDir/network.php.orig
				cp -f $piholeDir/db_queries.php $piholeDir/db_queries.php.orig
				echo "Backup completed!"
				break;;
        [Nn]* ) break;;
        * ) echo "Please answer Yes (y) or No (n).";;
    esac
done
while true; do
    read -p "Install THTV Dark Theme now? (Y/n): " yn
    case $yn in
        [Yy]|""* ) 
				git clone https://github.com/TheHeadyTV/pihole.git temp
				# Deleting all existing files...
				rm -f $piholeDir/style/vendor/AdminLTE.min.css
				rm -f $piholeDir/style/vendor/skin-blue.min.case
				rm -f $piholeDir/scripts/pi-hole/js/index.js
				rm -f $piholeDir/scripts/pi-hole/js/auditlog.js
				rm -f $piholeDir/scripts/pi-hole/js/network.js
				rm -f $piholeDir/scripts/pi-hole/js/queries.js
				rm -f $piholeDir/scripts/pi-hole/js/db_queries.js
				rm -f $piholeDir/scripts/pi-hole/php/queryads.php
				rm -f $piholeDir/index.php
				rm -f $piholeDir/network.php
				rm -f $piholeDir/db_queries.php
				
				# Copying new files...
				cp temp/style/vendor/AdminLTE.min.css $piholeDir/style/vendor/AdminLTE.min.css
				cp temp/style/vendor/skin-blue.min.css $piholeDir/style/vendor/skin-blue.min.css
				cp temp/scripts/pi-hole/js/index.js $piholeDir/scripts/pi-hole/js/index.js
				cp temp/scripts/pi-hole/js/auditlog.js $piholeDir/scripts/pi-hole/js/auditlog.js
				cp temp/scripts/pi-hole/js/network.js $piholeDir/scripts/pi-hole/js/network.js
				cp temp/scripts/pi-hole/js/queries.js $piholeDir/scripts/pi-hole/js/queries.js
				cp temp/scripts/pi-hole/js/db_queries.js $piholeDir/scripts/pi-hole/js/db_queries.js
				cp temp/scripts/pi-hole/php/queryads.php $piholeDir/scripts/pi-hole/php/queryads.php
				cp temp/index.php $piholeDir/index.php
				cp temp/network.php $piholeDir/network.php
				cp temp/db_queries.php $piholeDir/db_queries.php
					
				rm -rf temp/
				break;;
        [Nn]* ) break;;
        * ) echo "Please answer Yes (y) or No (n).";;
    esac
done
echo "All done!"