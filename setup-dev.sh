#!/bin/bash

set -e  # Para o script se qualquer comando falhar

echo "Atualizando pacotes..."
sudo apt update -y
sudo apt upgrade -y

echo "Instalando Python 3.10 e dependências..."
sudo apt install python3.10-full python3.10-dev -y

echo "Instalando pacotes essenciais..."
sudo apt install git curl build-essential dkms perl wget -y
sudo apt install gcc make default-libmysqlclient-dev libssl-dev -y
sudo apt install -y zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev llvm \
  libncurses5-dev libncursesw5-dev \
  xz-utils tk-dev libffi-dev liblzma-dev python3-openssl git

echo "Instalando pyenv..."
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

# Adicionando configuração do pyenv ao final do .zshrc
echo "Configurando pyenv no ~/.zshrc ..."
cat <<EOF >> ~/.zshrc

# >>> Pyenv Config
export PATH="\$HOME/.pyenv/bin:\$PATH"
eval "\$(pyenv init -)"
eval "\$(pyenv virtualenv-init -)"
# <<< Pyenv Config
EOF

echo "Baixe e instale o VS Code manualmente:"
echo "https://code.visualstudio.com/download"
echo ""

echo "Instalando ZSH..."
sudo apt install zsh -y
echo "Alterando shell padrão para zsh..."
chsh -s /bin/zsh

echo "Instalando Oh-My-Zsh..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Instalando Spaceship Prompt..."
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -sf "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

echo "Instalando Zsh Autosuggestions..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "Instalando Zsh Syntax Highlighting..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Alterando ZSH_THEME e plugins no ~/.zshrc
echo "Configurando Spaceship Prompt e plugins no ~/.zshrc ..."

# Troca o tema para spaceship
if grep -q '^ZSH_THEME=' ~/.zshrc; then
    sed -i 's/^ZSH_THEME=.*/ZSH_THEME="spaceship"/' ~/.zshrc
else
    echo 'ZSH_THEME="spaceship"' >> ~/.zshrc
fi

# Troca/insere os plugins
if grep -q '^plugins=' ~/.zshrc; then
    sed -i 's/^plugins=.*/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc
else
    echo 'plugins=(git zsh-autosuggestions zsh-syntax-highlighting)' >> ~/.zshrc
fi

# Instala fonte Ubuntu Mono for Powerline (opcional)
echo "Instalando fonte Ubuntu Mono for Powerline (opcional)..."
mkdir -p ~/.fonts
git clone https://github.com/pdf/ubuntu-mono-powerline-ttf.git ~/.fonts/ubuntu-mono-powerline-ttf
fc-cache -vf

echo ""
echo "=== PASSOS FINAIS ==="
echo "1. REINICIE O TERMINAL."
echo "2. Nas preferências do terminal, selecione a fonte: Ubuntu Mono for Powerline."
echo "3. O tema do Zsh já está configurado para spaceship e os plugins já estão prontos."
echo "4. O pyenv já foi configurado no ~/.zshrc."
echo "5. Baixe o VS Code manualmente em https://code.visualstudio.com/download"
echo ""
echo "PRONTO! Se quiser, reinicie o computador (recomendado)."
 
