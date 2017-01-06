<VirtualHost *:80>
	ServerAdmin webmaster@localhost

	DocumentRoot ${site_public_path}
	ServerName ${domain}
	ServerAlias www.${domain}
	<IfModule mpm_itk_module>
    	   AssignUserId ${user} www-data
        </IfModule>
	<Directory ${site_public_path}>
		Order allow,deny
   		Allow from all
		Require all granted
                AllowOverride All
	</Directory>
	
	CustomLog ${site_log_path}access.log common
	ErrorLog ${site_log_path}error.log
	<IfModule mod_fastcgi.c>
     		AddHandler php-fcgi.${domain} .php
    		Action php-fcgi.${domain} /php-fcgi.${domain}
    		Alias /php-fcgi.${domain} /usr/lib/cgi-bin/php-fcgi.${domain}
    		FastCgiExternalServer /usr/lib/cgi-bin/php-fcgi.${domain} -socket /var/run/${php_prefix}.${domain}.sock -pass-header Authorization -idle-timeout 3600
 
    		<Directory "/usr/lib/cgi-bin">
    			Require all granted
    		</Directory>
    	</IfModule>
</VirtualHost>

