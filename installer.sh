#!/bin/bash

if [ "$(id -u)" != "0" ]; then
   echo -e "\e[1;31mYou have to run this script with root permissions.\e[0m"
   exit 1
fi

while true; do
    read -p "Create a backup of the current files? (Y/n): " yn
    case $yn in
        [Yy]|""* ) 
		# Backup of all changed files...
 	        cp -f admin/style/vendor/AdminLTE.min.css admin/style/vendor/AdminLTE.min.css.orig
 	        cp -f admin/style/vendor/skin-blue.min.css admin/style/vendor/skin-blue.min.css.orig
		cp -f admin/scripts/pi-hole/js/index.js admin/scripts/pi-hole/js/index.js.orig
 	        cp -f admin/scripts/pi-hole/js/network.js admin/scripts/pi-hole/js/network.js.orig
 	        cp -f admin/scripts/pi-hole/js/queries.js admin/scripts/pi-hole/js/queries.js.orig
 	        cp -f admin/scripts/pi-hole/php/queryads.php admin/scripts/pi-hole/php/queryads.php.orig
 	        cp -f admin/index.php admin/index.php.orig
 	        cp -f admin/network.php admin/network.php.orig
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
            	rm -f admin/style/vendor/AdminLTE.min.css
		rm -f admin/style/vendor/skin-blue.min.case
		rm -f admin/scripts/pi-hole/js/index.js
		rm -f admin/scripts/pi-hole/js/network.js
		rm -f admin/scripts/pi-hole/js/queries.js
		rm -f admin/scripts/pi-hole/php/queryads.php
		rm -f admin/index.php
		rm -f admin/network.php
		
		# Copying new files...
            	cp temp/style/vendor/AdminLTE.min.css admin/style/vendor/AdminLTE.min.css
		cp temp/style/vendor/skin-blue.min.css admin/style/vendor/skin-blue.min.css
		cp temp/scripts/pi-hole/js/index.js admin/scripts/pi-hole/js/index.js			
		cp temp/scripts/pi-hole/js/network.js admin/scripts/pi-hole/js/network.js
		cp temp/scripts/pi-hole/js/queries.js admin/scripts/pi-hole/js/queries.js
		cp temp/scripts/pi-hole/php/queryads.php admin/scripts/pi-hole/php/queryads.php
		cp temp/index.php admin/index.php
		cp temp/network.php admin/network.php
			
	    	rm -rf temp/
		break;;
        [Nn]* ) break;;
        * ) echo "Please answer Yes (y) or No (n).";;
    esac
done
echo "All done!"
