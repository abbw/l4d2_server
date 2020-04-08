#!/bin/bash
# 脚本作者：笨蛋海绵
# Github  ：https://github.com/abbw
# 博客    ：https://abbw.ml

red='\e[91m'
green='\e[92m'
yellow='\e[93m'
magenta='\e[95m'
cyan='\e[96m'
none='\e[0m'

# 检测root权限
[[ $(id -u) != 0 ]] && echo -e "请使用$red root $none用户运行$yellow ~(^_^) $none" && exit 1

cmd="apt-get"
sys_bit=$(uname -m)

case $sys_bit in
i[36]86)
	abbw_bit="386"
	;;
x86_64)
	abbw_bit="amd64"
	;;
*armv6*)
	abbw_bit="arm6"
	;;
*armv7*)
	abbw_bit="arm7"
	;;
*aarch64* | *armv8*)
	abbw_bit="arm64"
	;;
*)
	echo -e " 
	哈哈……这个 $red辣鸡脚本$none 不支持你的系统。 $yellow(-_-) $none

	备注: 仅支持 Ubuntu 16+ / Debian 8+ / CentOS 7+ 系统
	" && exit 1
	;;
esac

if [[ $(command -v yum) ]]; then

	cmd="yum"

fi

################# 这里是自定义api #################

pause() {
	read -rsp "$(echo -e "按$green Enter 回车键 $none继续....或按$red Ctrl + C $none取消.")" -d $'\n'
}

error() {
	echo -e "\n$red 输入错误！$none\n"
}

get_ip() {
	ip=$(curl -s ipinfo.io/ip)
}

################# 这里是自定义api #################

run_l4d2server() {
    clear
    if [[ -e ~/l4d2/srcds_run ]]; then
        read -rsp "$(echo -e "默认运行参数 $magenta+exec server.cfg +ip 0.0.0.0 +port 27015\n$none按$green Enter 回车键 $none继续....或按$red Ctrl + C $none取消.")" -d $'\n'
        ~/l4d2/srcds_run -game left4dead2 +exec server.cfg +ip 0.0.0.0 +port 27015
    else
        echo -e "
        $red 大胸弟...你貌似毛有安装 服务端 ....启动个鸡毛哦...

        $none仅支持使用我(abbw.ml)提供的 l4d2服务端一键搭建脚本" && exit 1
    fi
}

install_l4d2server() {
    if [ -f ~/l4d2/srcds_run ]; then
        echo -e "
		$red大胸弟...你已经安装l4d2服务端了 ....还安装个鸡毛哦...

        $none仅支持使用我(abbw.ml)提供的 l4d2服务端一键搭建脚本" && exit 1
	else
	   ~/steamcmd/steamcmd.sh +login anonymous +force_install_dir ~/l4d2 +app_update 222860 validate +quit
	   echo -e "
		$red恭喜……这个 $red辣鸡脚本$none，成功安装了L4D2服务端。$yellow（＾ｖ＾） $none" && exit 1
    fi
}

install_steamcmd() {
    if [ -f ~/steamcmd/steamcmd.sh ]; then
        return
    else
        mkdir ~/steamcmd && cd ~/steamcmd
        curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -
    fi
}

install_library() {
    if [[ $cmd == "yum" ]]; then
        $cmd install -y glibc libstdc++ glibc.i686 libstdc++.i686
    elif [[ $cmd == "apt-get" ]]; then
        $cmd install -y lib32gcc1
    else
	    echo -e " 
        哈哈……这个 $red辣鸡脚本$none 不支持你的系统$yellow (-_-)$none" && exit 1
    fi
}

run_install() {
    # 安装支持库
    install_library
    # 安装steamcmd
    install_steamcmd
    # 安装服务端
    install_l4d2server
}

clear
while :; do
	echo
	echo "########## 一键搭建求生之路服务端 by笨蛋海绵 ##########"
	echo
	echo "帮助说明: https://abbw.ml"
	echo
	echo " 1. 安装服务端"
	echo
	echo " 2. 运行服务器"
	echo
    echo " 3. 退出"
	echo
	read -p "请选择[1-3]:" choose
	case $choose in
	1)
		run_install
		break
		;;
	2)
		run_l4d2server
		break
		;;
    3)
		exit 1
		;;
	*)
		error
		;;
	esac
done
