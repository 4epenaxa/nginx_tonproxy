#!/bin/bash

# Создаем папку для keyring
mkdir -p /opt/ton-proxy/keyring

# Изменяем права на папку keyring для пользователя и группы с ID 1001
chown -R 1001:1001 /opt/ton-proxy/keyring

# Запускаем Docker контейнер с тон-прокси и генерируем adnl_[port], сохраняем в файл adnl_[port].txt
docker run -v /opt/ton-proxy/keyring:/opt/ton-proxy tonstakers/ton-proxy:latest generate-random-id -m adnlid > /opt/ton-proxy/adnl_code.txt

# Извлекаем второй набор символов из файлов adnl_[port].txt
adnl_code=$(awk '{print $2}' /opt/ton-proxy/adnl_code.txt)

# Разрешаем порт 3333 для UDP через ufw
ufw allow 3333/udp