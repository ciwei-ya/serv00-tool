#!/bin/bash

USER=$1 # ACCOUNTS_JSON 变量提供
DNS=$2 # ACCOUNTS_JSON 变量提供
WORKDIR="/home/${USER}/.nezha-agent" #哪吒探针文件夹
FILE_PATH="/home/${USER}/.s5" #Socks5文件夹
CRON_S5="nohup ${FILE_PATH}/s5 -c ${FILE_PATH}/config.json >/dev/null 2>&1 &" #Socks5启动指令
CRON_NEZHA="nohup ${WORKDIR}/start.sh >/dev/null 2>&1 &" #哪吒探针启动指令
ALIST_PATH="/home/${USER}/domains/${DNS}" #Alist文件夹
CRON_ALIST="cd ${ALIST_PATH} && screen -dmS alist ./alist server" #Alist启动指令
FANS_PATH="/home/${USER}/domains/fansMedalHelper" #B站粉丝牌助手文件夹
CRON_FANS="cd ${FANS_PATH} && rm /home/${USER}/domains/fansMedalHelper/log.txt && nohup python main.py > /home/${USER}/domains/fansMedalHelper/log.txt 2>&1 &" #B站粉丝牌助手指令
HYSTERIA_CONFIG="$WORKDIR/config.yaml"  # Hysteria 配置文件路径
CRON_HYSTERIA="nohup /home/${USER_LOWER}/.hysteria/hysteria-server -c $HYSTERIA_CONFIG >/dev/null 2>&1 &"  # Hysteria 启动命令

echo "检查并添加 crontab 任务"

if [ -e "${WORKDIR}/start.sh" ]; then
    echo "添加 nezha 的 crontab 重启任务"
    (crontab -l | grep -F "@reboot pkill -u ${USER} -x \"nezha-agent\" && ${CRON_NEZHA}") || (crontab -l; echo "@reboot pkill -u ${USER} -x \"nezha-agent\" && ${CRON_NEZHA}") | crontab -
    (crontab -l | grep -F "*/12 * * * * pgrep -x \"nezha-agent\" > /dev/null || ${CRON_NEZHA}") || (crontab -l; echo "*/12 * * * * pgrep -x \"nezha-agent\" > /dev/null || ${CRON_NEZHA}") | crontab -
  else
    echo "未安装nezha"
fi

if [ -e "${FILE_PATH}/config.json" ]; then
    echo "添加 socks5 的 crontab 重启任务"
    (crontab -l | grep -F "@reboot pkill -u ${USER} -x \"s5\" && ${CRON_S5}") || (crontab -l; echo "@reboot pkill -u ${USER} -x \"s5\" && ${CRON_S5}") | crontab -
    (crontab -l | grep -F "*/12 * * * * pgrep -x \"s5\" > /dev/null || ${CRON_S5}") || (crontab -l; echo "*/12 * * * * pgrep -x \"s5\" > /dev/null || ${CRON_S5}") | crontab -
  else
    echo "未安装socks5"
fi

if [ -e "${ALIST_PATH}/alist" ]; then
   echo "添加Alist重启任务"
   (crontab -l | grep -F "@reboot pkill -u ${USER} -x \"alist\" && ${CRON_ALIST}") || (crontab -l; echo "@reboot pkill -u ${USER} -x \"alist\" && ${CRON_ALIST}") | crontab -
   (crontab -l | grep -F "*/12 * * * * pgrep -x \"alist\" > /dev/null || ${CRON_ALIST}") || (crontab -l; echo "*/12 * * * * pgrep -x \"alist\" > /dev/null || ${CRON_ALIST}") | crontab -
  else
    echo "未安装Alist"
fi

if [ -e "${FANS_PATH}/main.py" ]; then
   echo "添加B站粉丝牌助手的 crontab 重启任务"
   (crontab -l | grep -F "@reboot pkill -u ${USER} -x \"python3.11\" && ${CRON_FANS}") || (crontab -l; echo "@reboot pkill -u ${USER} -x \"python3.11\" && ${CRON_FANS}") | crontab -
   (crontab -l | grep -F "0 22 * * * pgrep -x \"python3.11\" > /dev/null || ${CRON_FANS}") || (crontab -l; echo "0 22 * * * pgrep -x \"python3.11\" > /dev/null || ${CRON_FANS}") | crontab -
  else
    echo "未安装B站粉丝牌助手"
fi 

if [ -e "$HYSTERIA_CONFIG" ]; then
    echo "添加Hysteria 的 crontab 重启任务"
    (crontab -l | grep -F "*/12 * * * * pgrep -x \"hysteria-server\" > /dev/null || ${CRON_HYSTERIA}") || (crontab -l; echo "*/12 * * * * pgrep -x \"hysteria-server\" > /dev/null || ${CRON_HYSTERIA}") | crontab -
  else
    echo "未安装Hysteria"
fi 