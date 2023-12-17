# TelegramBotService

A systemd service to run telegram bots at startup. And actually any script.

## Installation

## Use

Here is how you can run your bots at startup:

1. Create a folder for your bot in the `/home/TelegramBots` folder.
2. In your bot folder you should put the code of your bot.
3. Create a `start_telegram_bot.sh` script in your folder.
4. Configure the script to start your bot.

The configuration is very generic and can run arbitrarty scripts. So be careful what you put in there :). 