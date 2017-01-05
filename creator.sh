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

function create_site_path {
    echo 'Сreated site path:';
    echo $site_path;
    mkdir -p $site_public_path;
    mkdir -p $site_log_path;
    mkdir -p $site_backup_path;
    mkdir -p $site_conf_path;
    chown -R $user:$user $site_path;
    chmod -R 755 $site_path;
}
function create_apache_vhost {
    local template;
    template=$(cat ./templates/apache/${site_template}.tpl);
    template=$(print_template "$template" global_template_vars);
    echo "$template" > $apache_conf_file;
    chown www-data:www-data $apache_conf_file;
    chmod 644 $apache_conf_file;
    ln -s $apache_conf_file $apache_enable_ln;
}

function create_php_fpm {
    local template;
    template=$(cat ./templates/php_fpm/${site_template}.tpl);
    template=$(print_template "$template" global_template_vars);
    echo "$template" > $php_fpm_conf_file;
    chown www-data:www-data $php_fpm_conf_file;
    chmod 644 $php_fpm_conf_file;
    ln -s $php_fpm_conf_file $php_fpm_conf_ln;
}
function write_hosts {
    echo "$hosts_ip    www.$domain $domain" >> /etc/hosts
}

function create_host {
    create_site_path;
    create_apache_vhost;
    create_php_fpm;
    write_hosts;
}
