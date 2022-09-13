#!/bin/bash

PS3='Que hacer? '
cal=("enable" "start" "stop")

select i in "${cal[@]}"
        do
        case $i in
                "enable")
                        for port in $(seq 3000 3003); do sudo systemctl enable devops@$port; done
                        ;;
                "start")
                        for port in $(seq 3000 3003); do sudo systemctl start devops@$port; done
                        ;;
                "stop")
                        for port in $(seq 3000 3003); do sudo systemctl stop devops@$port; done
                        ;;
                *) echo "error";;
        esac
done
