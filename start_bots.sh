#! /bin/bash

#change dir to execute scripts inside their directory
cd "/home/TelegramBots/"

echo "[Telegram Bots]: starting bots..."

for bot_dir in $(ls -d); do
    if [ "$bot_dir" == "." ]; then
        continue
    fi

    echo "[Telegram Bots]: starting bot  $bot_dir"

    # Check if the telegram bot is configured correctly
    start_bot_script = "$bot_dir/start_telegram_bot.sh"
    if [ ! -f "${start_bot_script}" ]; then
        echo "[Telegram Bots]: bot $bot_dir is missing a start_telegram_bot.sh script. Skipping."
        continue
    fi

    # Create log file
    log_file="$bot_dir/telegram_bot.log"
    if [ ! -f "$log_file" ]; then
        touch "$log_file"
        chmod 664 "$log_file"
    fi

    # Start bot
    cd $bot_dir
    nohup bash start_telegram_bot.sh &> "$log_file" &
    cd ..

done
