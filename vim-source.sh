sudo apt update
sudo apt install -y \
    git \
    build-essential \
    ncurses-dev \
    python3-dev \
    python3-pip \
    ruby-dev \
    lua5.1 \
    liblua5.1-dev \
    libperl-dev \
    libncurses5-dev \
    libgtk2.0-dev \
    libatk1.0-dev \
    libcairo2-dev \
    libx11-dev \
    libxpm-dev \
    libxt-dev


cd /usr/local/src
sudo git clone https://github.com/vim/vim.git
cd vim

./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-python3interp=yes \
            --with-python3-command=python3 \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --enable-cscope \
            --prefix=/usr/local

make -j$(nproc)
sudo make install

vim --version | grep python
sudo update-alternatives --install /usr/bin/editor editor /usr/local/bin/vim 1
sudo update-alternatives --set editor /usr/local/bin/vim
sudo ln -s /usr/local/bin/vim /usr/bin/vim
sudo ln -s /usr/local/bin/vim /usr/bin/vi

