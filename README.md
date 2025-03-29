# Serv00-tool
自用的Serv00的脚本,纯整合,自用!自用!自用!
## 仅个人使用!

## 天诚脚本 [CM视频教程](https://youtu.be/v6YOxCnekzM)

### Socks5 hysteria2 nohup模式
- 一键安装 **新手小白用这个！**
```bash
bash <(curl -s https://raw.githubusercontent.com/ciwei-ya/serv00-tool/refs/heads/main/install-socks5-hysteria.sh)
```
----

## 清理服务器

```bash
pkill -kill -u 用户名
chmod -R 755 ~/* 
chmod -R 755 ~/.* 
rm -rf ~/.* 
rm -rf ~/*
```

## Github Actions保活
添加 Secrets.`ACCOUNTS_JSON` 变量
```json
[
  {"username": "cmliusss", "password": "7HEt(xeRxttdvgB^nCU6", "panel": "panel4.serv00.com", "ssh": "s4.serv00.com","dns":"a"},
  {"username": "cmliussss2018", "password": "4))@cRP%HtN8AryHlh^#", "panel": "panel7.serv00.com", "ssh": "s7.serv00.com","dns":"b"},
  {"username": "4r885wvl", "password": "%Mg^dDMo6yIY$dZmxWNy", "panel": "panel.ct8.pl", "ssh": "s1.ct8.pl","dns":"c"}
]
```

# 致谢
[CM](https://github.com/cmliu/socks5-for-serv00)、[天诚](https://github.com/gshtwy/socks5-hysteria2-for-Serv00-CT8)、[RealNeoMan](https://github.com/Neomanbeta/ct8socks)、[k0baya](https://github.com/k0baya/nezha4serv00)、[eooce](https://github.com/eooce)
