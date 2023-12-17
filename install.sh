#!/bin/bash

# Check if the script is run as root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

telegram_bots_dir="/home/TelegramBots/"
start_bots_script="start_bots.sh"
systemd_dir="/etc/systemd/system/"
service_unit_name="telegram_bots.service"
uninstall_script="uninstall.sh"

# create dirs if they do not exist
[[ -d "${telegram_bots_dir}" ]] || mkdir "${telegram_bots_dir}"


# download and move system service unit
curl -o $service_unit_name "https://raw.githubusercontent.com/leoli51/TelegramBotService/main/telegram_bots.service"
mv $service_unit_name $systemd_dir

# download and move uninstall script
curl -o $uninstall_script "https://raw.githubusercontent.com/leoli51/TelegramBotService/main/uninstall.sh"
mv $uninstall_script $telegram_bot_dir

# download and move the start bots script
curl -o $start_bots_script "https://raw.githubusercontent.com/leoli51/TelegramBotService/main/start_bots.sh"
mv $start_bots_script $telegram_bot_dir

# enabling service
systemctl daemon-reload && systemctl enable $service_unit_name
if [[ $? -eq 0 ]]; then 
    echo "TelegramBots successfully installed."
else 
    echo "WARNING: Service could not be activated."
fi
