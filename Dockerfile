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
    && apt-get -y update \
    && apt-get -y upgrade \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y software-properties-common vim zsh git wget curl unzip htop gcc make cmake autoconf gnupg libgraphviz-dev \
    && add-apt-repository -y ppa:ondrej/php \
    && add-apt-repository -y ppa:ondrej/nginx \
    && wget https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb \
    && dpkg -i erlang-solutions_2.0_all.deb \
    && wget https://packages.erlang-solutions.com/ubuntu/erlang_solutions.asc \
    && apt-key add erlang_solutions.asc \
    && wget https://dev.mysql.com/get/mysql-apt-config_0.8.15-1_all.deb \
    && dpkg -i mysql-apt-config_0.8.15-1_all.deb \
    && apt-get -y update \
    && apt-get install -y erlang nginx php7.4-common php7.4-cli php7.4-bcmath php7.4-dev php7.4-xml php7.4-opcache php7.4-mbstring php7.4-mysql php7.4-fpm php7.4-gd php7.4-zip php7.4-curl php7.4-intl php7.4-json \
    && curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
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
    && wget https://dl.bintray.com/rabbitmq/all/rabbitmq-server/3.8.5/rabbitmq-server_3.8.5-1_all.deb \
    && dpkg -i rabbitmq-server_3.8.5-1_all.deb \
    && rabbitmq-server start \
    && rabbitmqctl add_user admin 123456 \
    && rabbitmqctl set_user_tags admin administrator \
    && rabbitmqctl set_permissions -p / admin '.*' '.*' '.*' \
    && rabbitmqctl delete_user guest \
    && rabbitmq-plugins enable rabbitmq_management rabbitmq_shovel rabbitmq_shovel_management \
    && apt install mysql-server \
    && wget http://download.redis.io/releases/redis-6.0.5.tar.gz \
    && tar xzf redis-6.0.5.tar.gz \
    && cd redis-6.0.5 \
    && make \
    && make install \
    && printf "yes\n" | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
    && wget -P ~/bin/ http://sphinxsearch.com/files/sphinx-3.3.1-b72d67b-linux-amd64.tar.gz

EXPOSE 80

CMD ["/bin/bash"]
