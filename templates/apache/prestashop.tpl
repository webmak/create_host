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
	</Directory>
	
	CustomLog ${site_log_path}access.log common
	ErrorLog ${site_log_path}error.log
	<IfModule mod_fastcgi.c>
     		AddHandler php-fcgi .php
    		Action php-fcgi /php-fcgi
    		Alias /php-fcgi /usr/lib/cgi-bin/php-fcgi
    		FastCgiExternalServer /usr/lib/cgi-bin/php-fcgi -socket /var/run/${php_prefix}.${domain}.sock -pass-header Authorization -idle-timeout 3600
 
    		<Directory "/usr/lib/cgi-bin">
    			Require all granted
    		</Directory>
                <FilesMatch \".+\.ph(p[345]?|t|tml)\$\">
        		SetHandler ${php_prefix}-${domain}
    		</FilesMatch>
    	</IfModule>
</VirtualHost>