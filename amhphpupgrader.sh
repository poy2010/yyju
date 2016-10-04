#!/bin/bash

function install-5.4()
{
	cd /tmp;
	wget http://cn2.php.net/distributions/php-5.4.41.tar.gz;
	tar -zxvf  php-5.4.41.tar.gz;
	cd php-5.4.41;
	./configure --prefix=/usr/local/php --enable-fpm --with-fpm-user=www --with-fpm-group=www --with-config-file-path=/etc --with-config-file-scan-dir=/etc/php.d --with-openssl --with-zlib  --with-curl --enable-ftp --with-gd --with-jpeg-dir --with-png-dir --with-freetype-dir --enable-gd-native-ttf --enable-mbstring --enable-zip --with-iconv=/usr/local/libiconv --with-mysql=/usr/local/mysql --without-pear ;
	make ;
	make install;
	edit-conf;
}
function install-5.5()
{
	cd /tmp;
	wget http://cn2.php.net/distributions/php-5.5.25.tar.gz;
	tar -zxvf  php-5.5.25.tar.gz;
	cd php-5.5.25;
	./configure --prefix=/usr/local/php --enable-fpm --with-fpm-user=www --with-fpm-group=www --with-config-file-path=/etc --with-config-file-scan-dir=/etc/php.d --with-openssl --with-zlib  --with-curl --enable-ftp --with-gd --with-jpeg-dir --with-png-dir --with-freetype-dir --enable-gd-native-ttf --enable-mbstring --enable-zip --with-iconv=/usr/local/libiconv --with-mysql=/usr/local/mysql --without-pear ;
	make ;
	make install;
	edit-conf;
}
function install-5.6()
{
	cd /tmp;
	wget http://cn2.php.net/distributions/php-5.6.9.tar.gz;
	tar -zxvf  php-5.6.9.tar.gz;
	cd php-5.6.9;
	./configure --prefix=/usr/local/php --enable-fpm --with-fpm-user=www --with-fpm-group=www --with-config-file-path=/etc --with-config-file-scan-dir=/etc/php.d --with-openssl --with-zlib  --with-curl --enable-ftp --with-gd --with-jpeg-dir --with-png-dir --with-freetype-dir --enable-gd-native-ttf --enable-mbstring --enable-zip --with-iconv=/usr/local/libiconv --with-mysql=/usr/local/mysql --without-pear ;
	make ;
	make install;
	edit-conf;
}
function edit-conf()
{
	sed -i 's:listen = /tmp/php-cgi.sock:listen = /tmp/php-cgi.sock\nlisten.group=www:g'  /usr/local/php/etc/php-fpm*;
	sed -i 's:listen = /tmp/php-cgi.sock:listen = /tmp/php-cgi.sock\nlisten.group=www:g'  /usr/local/php/etc/fpm/*;
}
function index()
{
	Infor='
                                  AMH4.2 PHP upgrade                                  
                            Powered by Vpser.Club 2014-2016 
==========================================================================';
	echo "$Infor";
	echo 'Please Input Your Choice 
		1) Upgrade PHP-5.3.27 To PHP-5.4.40;
		2) Upgrade PHP-5.3.27 To PHP-5.5.24;
		3) Upgrade PHP-5.3.27 To PHP-5.6.8;
		4) Exit;
		You Can Input 1,2,3,4 To Upgrade Or Exit.'
	read  Cho
	case $Cho in
		1)
		install-5.4
		;;
		2)
		install-5.5
		;;
		3)
		install-5.6
		;;
		*)
		exit
		;;
	esac
}
index
amh php restart
