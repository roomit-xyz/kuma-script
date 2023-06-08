#!/bin/bash

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mkdir -p bin systemd lib crontab
cat > ${HOME}/.zshrc<<EOF
export ZSH="\$HOME/.oh-my-zsh"
ZSH_THEME="xiong-chiamiov-plus"
plugins=(git)
source \$ZSH/oh-my-zsh.sh
export PATH="\${PATH}:${HOME}/bin"
EOF
source ${HOME}/.zshrc
cat > ${HOME}/systemd/init.service<<EOF
[Unit]
Description=init Cosmos daemon
After=network-online.target

[Service]
User=
Group=
ExecStart=
Restart=on-failure
RestartSec=3
LimitNOFILE=4096

[Install]
WantedBy=multi-user.target
EOF
