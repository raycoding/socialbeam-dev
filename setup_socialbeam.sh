function apt_get_stuff
{
    #dev tools
    sudo apt-get install build-essential bison openssl libreadline5 libreadline-dev curl git zlib1g zlib1g-dev libssl-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev
    # imagemagick
    sudo apt-get install imagemagick
    #memcache
    sudo apt-get install memcached
    #Java
    sudo add-apt-repository "deb http://archive.canonical.com/  lucid partner"
    sudo apt-get update
    install_jdk  
    #git and svn
    sudo aptitude install git-core subversion
}
function install_jdk
{
    cd /usr/lib/jvm
    sudo wget http://bab-backup.s3.amazonaws.com/jdk-6u29-linux-i586.bin
    sudo chmod +x jdk-6u29-linux-i586.bin
    sudo ./jdk-6u29-linux-i586.bin
    #  After the installation is done
    #  Put this in your /etc/bash.bashrc
    #  export JAVA_HOME=/usr/lib/jvm/jdk1.6.0_29
    # export JRE_HOME=/usr/lib/jvm/jdk1.6.0_29/jre

}

function install_rvm_ree
{
    echo "installing rvm"
    \curl -L https://get.rvm.io | bash -s stable
    rvm install ree
    rvm --default use ree
}

function rails_setup
{
    rvm gemset create rails3
    rvm use ree-1.8.7@rails3 
    #please note at time of installing the version of rvm was 1.8.7,please make changes if needed
    gem install rails -v=3.2.8
    rvm use ree-1.8.7@rails3 --default

}

function mysql_setup
{
    sudo apt-get install libmysqlclient-dev 
    gem install mysql
    sudo apt-get install mysql-server-5.1
}

function apache_setup
{
    sudo apt-get install apache2 apache2-mpm-prefork apache2-prefork-dev
}

function passenger_rails
{
   gem install passenger
   passenger-install-apache2-module

}

function setup_stuffs
{
  apt_get_stuff
  install_rvm_ree
  rails_setup
  mysql_setup
  apache_setup
  passenger_rails
}
