#!/usr/bin/env python
# -*- coding: utf-8 -*-
import redis
import os
redis = redis.Redis('localhost')
id = input("Enter SinChi Number (1,2,3,4,5,...) : ")
source = os.popen("cat ./bot.lua").read()
launcher = """while true; do
 ./telegram-cli -p sinchi-{} -s bot.lua
http_proxy="socks5://127.0.0.1:9151"
https_proxy="socks5://127.0.0.1:9151"
ftp_proxy="socks5://127.0.0.1:9151"
socks4_proxy="socks5://127.0.0.1:9151"
socks5_proxy="socks5://127.0.0.1:9151"
URL_proxy="socks5://127.0.0.1:9151"
json_proxy="socks5://127.0.0.1:9151"
redis-server_proxy="socks5://127.0.0.1:9151"
redis_proxy="socks5://127.0.0.1:9151"
ssl_proxy="socks5://127.0.0.1:9151"
serpent_proxy="socks5://127.0.0.1:9151"
done""".format(id,id)
newlauncher = open("sinchi-{}.sh".format(id),"w")
newlauncher.write(launcher)
newlauncher.close()
os.popen("chmod 777 sinchi-{}.sh".format(id))
print("Done!\nNew SinChi Created...\n SinChi ID : {}\nRun : ./sinchi-{}.sh".format(id,id))
