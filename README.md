# Wordpress Install Script
> A one time command script to install Wordpress.

THis script is a bash script which installs Wordpress on an Apache server. The script also installs PHP7 or PHP5 if it's required.

You absolutly need a **mariadb/mysql** server to run Wordpress. The script also fixes the **CVE-2018-6389** vulnerability (DDoS vulnerability).


## Installation

Linux (Debian or Ubuntu **ONLY**):
> If you launch the script on Debian 8, PHP 5 will be installed.  

```sh
curl https://uploads.admlbs.fr/download.php?file=wordpress-install --output /usr/bin/wordpress-install && chmod 0777 /usr/bin/wordpress-install 
```
## Launch

> The script can be launched only with root or sudo
```sh
wordpress-install
```

or 
```
sudo wordpress-install
```

## Usage example

The script can be used for hosting-provider who wants their "newbie" costumers to be able to install Wordpress quickly and with no Linux knowledge required 
## Release History

* 0.1.0
    * The first release
    * CHANGE: Added PHP 7 & PHP 5 auto-install.
* 0.0.1
    * Work...

## Meta

Adam Elaoumari – [@AdamLBS2](https://twitter.com/AdamLBS2) – adam@admlbs.fr

This programm is distribued under GNU General Public License v3.0. See ``LICENSE`` for more information.

[https://github.com/AdamLBS](https://github.com/AdamLBS/)
