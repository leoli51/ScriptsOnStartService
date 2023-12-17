#! /bin/bash
systemctl disable telegram_bots.service
systemctl daemon-reload

rm -r /home/TelegramBots/
rm /etc/systemd/system/telegram_bots.service
