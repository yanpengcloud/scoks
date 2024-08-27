#!/bin/bash

# 脚本的目标 URL
INSTALL_SCRIPT_URL="https://raw.github.com/Lozy/danted/master/install.sh"

# 创建临时目录
TEMP_DIR=$(mktemp -d)
INSTALL_SCRIPT_PATH="$TEMP_DIR/Install.sh"

# 下载 Install.sh 文件
echo "正在下载安装脚本..."
curl -s -o "$INSTALL_SCRIPT_PATH" "$INSTALL_SCRIPT_URL"

# 确保下载成功
if [ ! -f "$INSTALL_SCRIPT_PATH" ]; then
  echo "下载失败，请检查网络连接或 URL 是否正确。"
  exit 1
fi

# 询问用户输入端口、用户名和密码
read -p "请输入端口号: " PORT
read -p "请输入用户名: " USER
read -sp "请输入密码: " PASSWD
echo

# 给予下载的脚本执行权限
chmod +x "$INSTALL_SCRIPT_PATH"

# 执行 Install.sh 脚本
echo "正在启动 SOCKS5 代理服务..."
"$INSTALL_SCRIPT_PATH" --port="$PORT" --user="$USER" --passwd="$PASSWD"

# 清理临时目录
rm -rf "$TEMP_DIR"

echo "SOCKS5 代理服务启动完成。"
