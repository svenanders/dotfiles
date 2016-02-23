#!/usr/local/bin/bash
read -r -p "Which app do you want to kill? " response

ps aux | grep -ie $response | awk '{print $2}' | xargs kill -9
