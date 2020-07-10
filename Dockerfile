echo 'deb http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse

deb http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse

deb http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse

deb http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse

deb http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse' > /etc/apt/sources.list \
&& apt-get -y update \
&& apt-get install -y software-properties-common \
&& LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php \
&& LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/nginx \
&& apt-get -y update \
&& apt-get -y upgrade \
&& sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
&& apt-get install -y vim git wget curl unzip htop \
&& apt-get install -y php7.4-common php7.4-cli php7.4-bcmath php7.4-dev php7.4-xml php7.4-opcache php7.4-mbstring php7.4-mysql php7.4-fpm php7.4-gd php7.4-zip php7.4-curl php7.4-intl php7.4-json \
&& pecl install -y yaf \
&& pecl install -y yac \
&& pecl install -y yaconf \
&& pecl install -y amqp \
&& pecl install -y varnish \
&& pecl install -y msgpack \
&& pecl install -y igbinary \
&& pecl install -y redis \
&& pecl install -y mongodb \
&& pecl install -y swoole \
&& pecl install -y seaslog \
&& pecl install -y xhprof