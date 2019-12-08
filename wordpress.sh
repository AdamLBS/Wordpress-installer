#!/bin/bash
# By Adam ELAOUMARI under GNU General Public License v3.0
# Contact : adam[at]admlbs.fr
# Mosts comments are in french. If you have questions just e-mail me 
###################################################
debian_version=$(read -d . VERSION < /etc/debian_version)
debian_8 () {
  apt install ca-certificates apt-transport-https
  wget -q https://packages.sury.org/php/apt.gpg -O- | sudo apt-key add -
  echo "deb https://packages.sury.org/php/ jessie main" | tee /etc/apt/sources.list.d/php.list
}
debian_9 () {
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' apache2|grep "install ok installed")
echo Checking for apache2: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo "No apache2. Setting up apache2."
   apt-get --force-yes --yes install apache2
fi
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' unzip|grep "install ok installed")
echo Checking for unzip: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo "No php-mysql. Setting up unzip."
   apt-get --force-yes --yes install unzip
fi
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' libapache2-mod-php|grep "install ok installed")
echo Checking for libapache2-mod-php: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo "No php-mysql. Setting up libapache2-mod-php."
   apt-get --force-yes --yes install libapache2-mod-php
fi
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' php-mysql|grep "install ok installed")
echo Checking for php-mysql: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo "No php-mysql. Setting up php-mysql."
   apt-get --force-yes --yes install php-mysql
fi
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' php-curl|grep "install ok installed")
echo Checking for php-curl: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo "No php-curl. Setting up php-curl."
   apt-get --force-yes --yes install php-curl
fi
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' php-json|grep "install ok installed")
echo Checking for php-json: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo "No php-json. Setting up php-json."
   apt-get --force-yes --yes install php-json
fi
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' php-gd|grep "install ok installed")
echo Checking for php-gd: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo "No php-gd. Setting up php-gd."
  apt-get --force-yes --yes install software-properties-common
      apt-get --force-yes --yes install php-gd
fi
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' git|grep "install ok installed")
echo Checking for git: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo "No git. Setting up git."
   apt-get --force-yes --yes install git
fi
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' php-gd|grep "install ok installed")
echo Checking for php-gd: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo "No git. Setting up php-gd."
   apt-get --force-yes --yes install php-gd
fi
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' php-msgpack|grep "install ok installed")
echo Checking for php-msgpack: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo "No php-intl. Setting up php-msgpack."
   apt-get --force-yes --yes install php-msgpack
fi
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' php-intl|grep "install ok installed")
echo Checking for php-intl: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo "No php-intl. Setting up php-intl."
   apt-get --force-yes --yes install php-intl
fi
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' php-sqlite3|grep "install ok installed")
echo Checking for php-sqlite3: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo "No php-sqlite3. Setting up php-sqlite3."
   apt-get --force-yes --yes install php-sqlite3
fi
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' php-gmp|grep "install ok installed")
echo Checking for php-gmp: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo "No php-gmp. Setting up php-gmp."
   apt-get --force-yes --yes install php-gmp
fi
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' php-geoip|grep "install ok installed")
echo Checking for php-geoip: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo "No php-geoip. Setting up php-geoip."
   apt-get --force-yes --yes install php-geoip
fi
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' php-mbstring|grep "install ok installed")
echo Checking for php-mbstring: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo "No php-mbstring. Setting up php-mbstring."
   apt-get --force-yes --yes install php-mbstring
fi
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' php-xml|grep "install ok installed")
echo Checking for php-xml: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo "No git. Setting up php-xml."
   apt-get --force-yes --yes install php-xml
fi
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' php-zip|grep "install ok installed")
echo Checking for php-zip: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo "No git. Setting up php-zip."
   apt-get --force-yes --yes install php-zip
fi
}
if [ "$debian_version" == "8" ]
then 
debian_8
else 
debian_9
fi

#####################################
install_folder=$(whiptail --title "Wordpress Install" --inputbox "What is your web-server directory (for example : /var/www or /var/www/html)" 10 60  3>&1 1>&2 2>&3)
cd $install_folder 2> /dev/null
if cd $install_folder 2> /dev/null; then echo " "  ; else echo -e "\e[32mThe folder does not exist therefore it has been created.\e[0m" && mkdir -p $install_folder ; fi
cd $install_folder

echo "Fetching latest version of WordPress...";
wget --quiet http://wordpress.org/latest.zip;
unzip -q latest.zip;

echo "Fetching All-in-One-SEO-Pack plugin...";
wget --quiet http://downloads.wordpress.org/plugin/all-in-one-seo-pack.zip;
unzip -q all-in-one-seo-pack.zip;
mv all-in-one-seo-pack wordpress/wp-content/plugins/

echo "Fetching Google Sitemap Generator plugin...";
wget --quiet http://downloads.wordpress.org/plugin/google-sitemap-generator.zip;	
unzip -q  google-sitemap-generator.zip;	
mv google-sitemap-generator wordpress/wp-content/plugins/

echo "Fetching Secure WordPress plugin...";
wget --quiet http://downloads.wordpress.org/plugin/secure-wordpress.zip;
unzip -q  secure-wordpress.zip;
mv secure-wordpress wordpress/wp-content/plugins/

echo "Fetching Hierarchy plugin...";
wget --quiet http://downloads.wordpress.org/plugin/hierarchy.zip;
unzip -q  hierarchy.zip;
mv hierarchy wordpress/wp-content/plugins/

echo "Fetching Image Widget plugin...";
wget --quiet http://downloads.wordpress.org/plugin/image-widget.zip;
unzip -q  image-widget.zip;
mv image-widget wordpress/wp-content/plugins/

echo "Fetching Super Cache plugin...";
wget --quiet http://downloads.wordpress.org/plugin/wp-super-cache.zip;
unzip -q  wp-super-cache.zip;
mv wp-super-cache wordpress/wp-content/plugins/

echo "Fetching W3 Total Cache...";
wget --quiet http://downloads.wordpress.org/plugin/w3-total-cache.zip
unzip -q  w3-total-cache.zip;
mv w3-total-cache wordpress/wp-content/plugins/

echo "Fetching WordPress Importer...";
wget --quiet http://downloads.wordpress.org/plugin/wordpress-importer.zip
unzip -q wordpress-importer.zip
mv wordpress-importer wordpress/wp-content/plugins/

echo "Fetching Meta Box plugin..."
wget --quiet "http://downloads.wordpress.org/plugin/meta-box.zip"
unzip -q meta-box.zip
mv meta-box wordpress/wp-content/plugins/

echo "Fetching Options Framework plugin..."
wget --quiet "http://downloads.wordpress.org/plugin/options-framework.zip"
unzip -q options-framework.zip
mv options-framework wordpress/wp-content/plugins/

echo "BackupWPup...";
wget --quiet http://downloads.wordpress.org/plugin/backwpup.zip
unzip -q backwpup.zip
mv backwpup wordpress/wp-content/plugins/

echo "Cleaning up temporary files and directories...";
rm *.zip

echo "Fixing CVE-2018-6389 vulnerability"

if [[ -f wp-login.php && -f wp-admin/load-scripts.php && -f wp-admin/includes/noop.php ]]
then
        sed -i "1 s/^.*$/<?php\ndefine('CONCATENATE_SCRIPTS', false);/" wp-login.php
        sed -i -e "s/^require( ABSPATH . WPINC . '\/script-loader.php' );$/require( ABSPATH . 'wp-admin\/admin.php' );/g" wp-admin/load-scripts.php
        sed -i -e "s/^require( ABSPATH . WPINC . '\/script-loader.php' );$/require( ABSPATH . 'wp-admin\/admin.php' );/g" wp-admin/load-styles.php
        echo """<?php
/**
* Noop functions for load-scripts.php and load-styles.php.
*
* @package WordPress
* @subpackage Administration
* @since 4.4.0
*/
function get_file( \$path ) {
        if ( function_exists('realpath') ) {
                \$path = realpath( \$path );
        }
        if ( ! \$path || ! @is_file( \$path ) ) {
                return '';
        }
        return @file_get_contents( \$path );    
}""" > wp-admin/includes/noop.php
		echo 'Successfuly patched.'
else
        echo ''
fi
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' ifconfig|grep "install ok installed")
if [ "" == "$PKG_OK" ]; then
IP=$(ip address|sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p')
else
IP=$(ifconfig|sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p')
fi
echo "Done !"
echo "The IP of your webserver is $IP. Thanks ! "
