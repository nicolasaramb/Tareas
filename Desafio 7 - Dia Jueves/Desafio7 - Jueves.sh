#!/bin/bash

PS3='Que hacer? '
cal=("Instalar" "Enable" "Start" "Stop" "InstalarENGIX" "InstalarSSH")

select i in "${cal[@]}"
        do
        case $i in
                	"Instalar")
               			git clone https://github.com/roxsross/challenge-linux-bash
				sudo apt install nodejs -y
				sudo apt install npm -y 
				sudo apt install gcc g++ make -y
				touch /lib/systemd/system/devops@.service
                		;;
			"Enable")
				for port in $(seq 3000 3003); do sudo systemctl enable devops@$port; done
				;;
			"Start")
				for port in $(seq 3000 3003); do sudo systemctl start devops@$port; done
				;;
			"Stop")
				for port in $(seq 3000 3003); do sudo systemctl stop devops@$port; done
				;;
			"InstalarENGIX")
				sudo apt install nginx -y
				cd /etc/nginx/sites-available/
				sudo truncate -s0 default.conf
				touch default.conf
				sudo systemctl restart nginx
				;;
			"InstalarSSH")
				sudo apt install certbot python3-certbot-nginx -y
				sudo certbot --non-interactive --nginx -d 3.237.180.24.sslip.io -d www.3.237.180.24.sslip.io -m nicolasaramburger@gmail.com --agree-tos
            *) echo "error";;
        esac
done
