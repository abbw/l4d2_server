# l4d2_server

l4d2服务端一键安装脚本 &amp; 运行脚本

# 主要功能

* 自动安装所需支持库
* 自动安装steamcmd
* 自动安装l4d2服务端

# 环境要求（已测试）

* 支持的操作系统：CentOS 7-8、Ubuntu 16-18
* 操作系统要求64位

**虽然以上系统经过了基本测试，但不排除可能存着某些特殊情况无法安装，如有问题，请在Github Issues反馈**

# 安装l4d2_server

一键安装脚本（使用root用户）：

强烈使用screen运行

```bash
#海外
bash <(curl -Lsk https://raw.githubusercontent.com/abbw/l4d2_server/master/l4d2_server.sh)
#国内
bash <(curl -Lsk https://raw.githubusercontent.com/abbw/l4d2_server/master/l4d2_server.sh) cdn
```

如果出现`-bash: curl: command not found`错误，说明`curl`命令没安装，请输入下面的命令先安装`curl`，再回过头来执行上面的命令再来一次。

# 部分截图

![](https://ftp.bmp.ovh/imgs/2020/04/8388bffdf51fffc1.png)

# 联系我

* Blog: [https://abbw.ml/](https://abbw.ml/)
* QQ: 1037886804

# 请我喝一杯咖啡

![](https://ftp.bmp.ovh/imgs/2020/04/035ffc48491951b4.jpg)
