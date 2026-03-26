#!/bin/bash
#Проверка доступности сервера (слушается ли порт 80)
if ! nc -z -w 3 localhost 80; then
    echo "Port is not avalible"
    exit 1
fi

#Проверка наличия index.html
if ! ls /var/www/html/index*.html | grep -q . 2>/dev/null; then
    echo "No such file"
    exit 1
fi

exit 0