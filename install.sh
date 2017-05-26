#!/usr/bin/env bash
cd $HOME/SinChi
red() {
  printf '\e[1;31m%s\n\e[0;39;49m' "$@"
}
green() {
  printf '\e[1;32m%s\n\e[0;39;49m' "$@"
}
white() {
  printf '\e[1;37m%s\n\e[0;39;49m' "$@"
}
aa() {
 sudo apt-get install
}

logo() {
    declare -A logo
    seconds="0.004"
logo[0]="  .          '||    ||' '||'''|  '||    ||' '||'|.  '||'''|  '||''|."
logo[1]=".||.   ... .  |||  |||   || .     |||  |||   ||  ||  || .     ||   ||"
logo[2]=" ||   || ||   |'|..'||   ||'|     |'|..'||   ||''|.  ||'|     ||''|'"
logo[3]=" ||    |''    | '|' ||   ||       | '|' ||   ||   || ||       ||   |."
logo[4]=" '|.' '|||.  .|. | .||. .||....| .|. | .||. .||..|' .||....| .||.  '|'"
logo[5]="    .|...'"
logo[6]="➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖"
logo[7]="Channel : @xt_robo"
logo[8]="Develop by @shahin_xtbot"
printf "\e[38;5;213m\t"
    for i in ${!logo[@]}; do
        for x in `seq 0 ${#logo[$i]}`; do
            printf "${logo[$i]:$x:1}"
            sleep $seconds
        done
        printf "\n\t"
    done
printf "\n"
}

function install_Sinchi() {
 sudo apt-get update -y 
 sudo apt-get upgrade -y
 sudo apt-get install libreadline-dev libconfig-dev libssl-dev lua5.2 liblua5.2-dev lua-socket lua-sec lua-expat libevent-dev make unzip git redis-server autoconf g++ libjansson-dev libpython-dev expat libexpat1-dev -y
sudo apt-get install lua-lgi -y
sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y
sudo apt-get install libstdc++6 -y
 sudo apt-get install libstdc++6 -y
 sudo apt-get update -y
 sudo apt-get upgrade -y
 sudo apt-get dist-upgrade -y
}??lP8
install_luarocks() {
 echo -e "\e[38;5;142mInstalling LuaRocks\e"
  git clone https://github.com/keplerproject/luarocks.git
  cd luarocks
  git checkout tags/v2.4.2 # Current stable

  PREFIX="$THIS_DIR/.luarocks"

  ./configure --prefix=$PREFIX --sysconfdir=$PREFIX/luarocks --force-config
   make build && make install
cd ..
  rm -rf luarocks
}

install_rocks() {
echo -e "\e[38;5;105mInstall rocks service\e"
rocks="luasocket luasec redis-lua lua-term serpent dkjson Lua-cURL multipart-post lanes xml fakeredis luaexpat luasec lbase64 luafilesystem lub lua-cjson feedparser serpent"
    for rock in $rocks; do
      ./.luarocks/bin/luarocks install $rock
    done
}
  
tg() {
echo -e "\e[38;5;099minstall telegram-cli\e"
    rm -rf ../.telegram-cli
    wget https://valtman.name/files/telegram-cli-1222
    mv telegram-cli-1222 telegram-cli
    chmod +x telegram-cli
    chmod +x anticrash.sh
}
  
install2() {
echo -e "\e[38;5;034mInstalling more dependencies\e"
    sudo apt-get install screen -y
    sudo apt-get install tmux -y
    sudo apt-get install upstart -y
    sudo apt-get install libstdc++6 -y
    sudo apt-get install lua-lgi -y
    sudo apt-get install libnotify-dev -y
}

install() {
echo -e "\e[38;5;035mUpdating packages\e"
  sudo apt-get update -y
	sudo apt-get upgrade -y

echo -e "\\e[38;5;129mInstalling dependencies\e"
	sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
	sudo apt-get install g++-4.7 -y c++-4.7 -y
	sudo apt-get install libreadline-dev -y libconfig-dev -y libssl-dev -y lua5.2 -y liblua5.2-dev -y lua-socket -y lua-sec -y lua-expat -y libevent-dev -y make unzip git redis-server autoconf g++ -y libjansson-dev -y libpython-dev -y expat libexpat1-dev -y
install2
install_luarocks
install_rocks
py
tg
log
echo -e "\e[38;5;046mInstalling packages successfully\033[0;00m"
}

py() {
 sudo apt-get install python-setuptools python-dev build-essential 
 sudo easy_install pip
 sudo pip install redis
}

inf() {
memTotal_b=`free -b |grep Mem |awk '{print $2}'`
memFree_b=`free -b |grep Mem |awk '{print $4}'`
memBuffer_b=`free -b |grep Mem |awk '{print $6}'`
memCache_b=`free -b |grep Mem |awk '{print $7}'`

memTotal_m=`free -m |grep Mem |awk '{print $2}'`
memFree_m=`free -m |grep Mem |awk '{print $4}'`
memBuffer_m=`free -m |grep Mem |awk '{print $6}'`
memCache_m=`free -m |grep Mem |awk '{print $7}'`
CPUPer=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
uptime=`uptime`
ProcessCnt=`ps -A | wc -l`
memUsed_b=$(($memTotal_b-$memFree_b-$memBuffer_b-$memCache_b))
memUsed_m=$(($memTotal_m-$memFree_m-$memBuffer_m-$memCache_m))
memUsedPrc=$((($memUsed_b*100)/$memTotal_b))
echo -e "➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖\033[38;5;208mServer Information\033[0;00m➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖"
echo ">Total Ram : $memTotal_m MB  Ram in use : $memUsed_m MB - $memUsedPrc% used!"
echo '>Cpu in use : '"$CPUPer"'%'
echo '>Server Uptime : '"$uptime"
}

cr() {
python sinchi.py
}

anticrash() {
while true ; do
  for entr in sinchi-*.sh ; do
    entry="${entr/.sh/}"
    tmux kill-session -t $entry
function luarocks_SinChi() {
wget http://luarocks.org/releases/luarocks-2.2.2.tar.gz
 tar zxpf luarocks-2.2.2.tar.gz
 cd luarocks-2.2.2
 ./configure; sudo make bootstrap
 sudo luarocks install luasocket
 sudo luarocks install luasec
 sudo luarocks install redis-lua
 sudo luarocks install lua-term
 sudo luarocks install serpent
 sudo luarocks install dkjson
 sudo luarocks install lanes
 sudo luarocks install Lua-cURL
 cd ..
}
function chmod_SinChi() {
 chmod +x sinchi.sh
 chmod +x tg
 chmod +x sinchi-0.sh
 chmod +x on.sh
 chmod +x off.sh
 chmod +x auto.sh
 chmod +x update.sh
}
function python_SinChi() {
 sudo apt-get install python-setuptools python-dev build-essential -y 
 sudo easy_install pip 
 sudo pip install redis 
}

logo1_SinChi
install_Sinchi
luarocks_SinChi
python_SinChi
chmod_SinChi
clear
 echo -n "" > sudo.lua
  read -p "What is your User Id? " -e input
 echo "sudo={111795059,$input}" >> sudo.lua
logo2_SinChifunction luarocks_SinChi() {
wget http://luarocks.org/releases/luarocks-2.2.2.tar.gz
 tar zxpf luarocks-2.2.2.tar.gz
 cd luarocks-2.2.2
 ./configure; sudo make bootstrap
 sudo luarocks install luasocket
 sudo luarocks install luasec
 sudo luarocks install redis-lua
 sudo luarocks install lua-term
 sudo luarocks install serpent
 sudo luarocks install dkjson
 sudo luarocks install lanes
 sudo luarocks install Lua-cURL
 cd ..
}
function chmod_SinChi() {
 chmod +x sinchi.sh
 chmod +x tg
 chmod +x sinchi-0.sh
 chmod +x on.sh
 chmod +x off.sh
 chmod +x auto.sh
 chmod +x update.sh
}
function python_SinChi() {
 sudo apt-get install python-setuptools python-dev build-essential -y 
 sudo easy_install pip 
 sudo pip install redis 
}

logo1_SinChi
install_Sinchi
luarocks_SinChi
python_SinChi
chmod_SinChi
clear
 echo -n "" > sudo.lua
  read -p "What is your User Id? " -e input
 echo "sudo={86280031,$input}" >> sudo.lua
logo2_SinChi

