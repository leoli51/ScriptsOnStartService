#!/bin/bash

# Check if the script is run as root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

telegram_bots_dir="/home/TelegramBots/"
systemd_dir="/etc/systemd/system/"
service_unit_name="telegram_bots.service"

# create dirs if they do not exist
[[ -d "${telegram_bots_dir}" ]] || mkdir "${telegram_bots_dir}"


# move system service unit
mv $service_unit_name $systemd_dir
# move uninstall script


# enabling service
systemctl daemon-reload && systemctl enable $service_unit_name
if [[ $? -eq 0 ]]; then 
    echo "TelegramBots successfully installed."
else 
    echo "WARNING: Service could not be activated."
