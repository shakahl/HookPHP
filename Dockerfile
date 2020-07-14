FROM ubuntu:20.04

MAINTAINER <letwang> 498936940@qq.com

RUN echo 'deb http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse
    deb-src http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse
    deb http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse
    deb-src http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse
    deb http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse
    deb-src http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse
    deb http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse
    deb-src http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse
    deb http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse
    deb-src http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse' > /etc/apt/sources.list \
    && echo '151.101.76.133 raw.github.com
151.101.76.133 raw.githubusercontent.com
151.101.1.6 github.global-ssl.fastly.net
151.101.65.6 github.global-ssl.fastly.net
151.101.129.6 github.global-ssl.fastly.net
151.101.193.6 github.global-ssl.fastly.net
151.101.72.249 global-ssl.fastly.Net
140.82.114.4 github.com
52.74.223.119 github.com' >> /etc/hosts \
    && echo 'nameserver 223.5.5.5
nameserver 223.6.6.6' > /etc/resolv.conf \
    && apt-get -y update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y software-properties-common \
    && add-apt-repository -y ppa:apt-fast/stable \
    && add-apt-repository -y ppa:ondrej/php \
    && apt-get -y install apt-fast \
    && apt-fast install -y vim zsh git wget curl unzip htop gcc make cmake autoconf gnupg gnupg2 ca-certificates apt-transport-https libgraphviz-dev \
    && echo "deb http://nginx.org/packages/ubuntu focal nginx" | tee /etc/apt/sources.list.d/nginx.list \
    && curl -fsSL https://nginx.org/keys/nginx_signing.key | apt-key add - \
    && curl -fsSL https://github.com/rabbitmq/signing-keys/releases/download/2.0/rabbitmq-release-signing-key.asc | apt-key add - \
    && echo 'deb https://dl.bintray.com/rabbitmq-erlang/debian focal erlang
deb https://dl.bintray.com/rabbitmq/debian bionic main' >> /etc/apt/sources.list \
    && wget https://dev.mysql.com/get/mysql-apt-config_0.8.15-1_all.deb \
    && dpkg -i mysql-apt-config_0.8.15-1_all.deb \
    && apt-fast -y update
RUN apt-fast install -y nginx php7.4-common php7.4-cli php7.4-bcmath php7.4-dev php7.4-xml php7.4-opcache php7.4-mbstring php7.4-mysql php7.4-fpm php7.4-gd php7.4-zip php7.4-curl php7.4-intl php7.4-json \
    && php -r "copy('https://install.phpcomposer.com/installer', 'composer-setup.php');" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');" \
    && mv composer.phar /usr/local/bin/composer \
    && composer config -g repo.packagist composer https://packagist.phpcomposer.com \
    && pecl install msgpack \
    && pecl install igbinary \
    && pecl install yaf \
    && printf "yes\nyes\nyes\n" | pecl install yac \
    && pecl install yaconf \
    && printf "yes\nno\nno\n" | pecl install redis \
    && pecl install mongodb \
    && printf "yes\nyes\nyes\nyes\n" | pecl install swoole \
    && pecl install seaslog \
    && pecl install xhprof \
    && wget https://github.com/alanxz/rabbitmq-c/archive/v0.10.0.zip \
    && unzip v0.10.0.zip \
    && cd rabbitmq-c-0.10.0 \
    && mkdir build \
    && cd build \
    && cmake .. \
    && cmake --build . \
    && cmake -DCMAKE_INSTALL_PREFIX=/usr/local .. \
    && cmake --build . --target install \
    && printf "\n" | pecl install amqp \
    && apt-fast install -y --fix-missing rabbitmq-server \
    && rabbitmq-server \& \
    && rabbitmqctl add_user admin 123456 \
    && rabbitmqctl set_user_tags admin administrator \
    && rabbitmqctl set_permissions -p / admin '.*' '.*' '.*' \
    && rabbitmqctl delete_user guest \
    && rabbitmq-plugins enable rabbitmq_management rabbitmq_shovel rabbitmq_shovel_management \
    && wget http://download.redis.io/releases/redis-6.0.5.tar.gz \
    && tar xzf redis-6.0.5.tar.gz \
    && cd redis-6.0.5 \
    && make \
    && make install \
    && redis-server \& \
    && apt-fast install mysql-server \
    && mysqld --skip-grant-tables --skip-networking --user=root \& \
    && printf "yes\n" | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
    && wget -P ~/bin/ http://sphinxsearch.com/files/sphinx-3.3.1-b72d67b-linux-amd64.tar.gz

EXPOSE 80

CMD ["/bin/bash"]
