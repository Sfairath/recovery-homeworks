#!/bin/bash
DATE="$(date +'%Y-%m-%d %H:%M:%S')"
BACKUP_DIR="/tmp/backup"

#Создаём директорию для резервного копирования
if [ ! -d "$BACKUP_DIR" ]; then
    mkdir -p "$BACKUP_DIR"
    if [ $? -ne 0 ]; then
        echo "Не удалось создать директорию для бэкапа"
        exit 1
    fi
fi

#Резервное копирование
rsync -ac --delete --exclude=".*" ~/ "$BACKUP_DIR"
if [ $? -ne 0 ]; then
    LOG_MESSAGE="$DATE -- Ошибка при резервном копировании"
    echo "$LOG_MESSAGE" >> /var/log/rsync.log

    exit 1
fi

LOG_MESSAGE="$DATE -- Успешное резервное копирование"
echo "$LOG_MESSAGE" >> /var/log/rsync.log

exit 0