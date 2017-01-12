#!/bin/bash
# 
#Copyright 2017 webmak10@gmail.com
#
#Permission is hereby granted, free of charge, to any person obtaining a copy of 
#this software and associated documentation files (the "Software"), to deal in 
#the Software without restriction, including without limitation the rights to 
#use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies 
#of the Software, and to permit persons to whom the Software is furnished to do 
#so, subject to the following conditions:
#
#The above copyright notice and this permission notice shall be included in all 
#copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
#THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS 
#IN THE SOFTWARE.

domain='some.org';
user='user';
php_path='/opt/php-7.0.14/';
hosts_ip='127.0.0.1';
site_template='magento';
php_prefix='php-fcgi';
sites_folder_name='sites';

source template_vars.sh;
source templater.sh;
source configurations_settings.sh;
source creator.sh;

configure_settings;

site_path="/home/${user}/${sites_folder_name}/${domain}/";
site_public_path="${site_path}www/";
site_log_path="${site_path}logs/";
site_backup_path="${site_path}backups/";
site_conf_path="${site_path}conf/";

apache_conf_file="${site_conf_path}apache-${domain}.conf";
apache_enable_ln="/etc/apache2/sites-enabled/${domain}.conf";

php_fpm_conf_file="${site_conf_path}php-fpm-${domain}.conf";
php_fpm_conf_ln="${php_path}etc/php-fpm.d/${domain}.conf";

#to do checking settings
create_host;
