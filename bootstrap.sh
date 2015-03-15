#!/bin/bash

echo "INSTALLING RESOURCES FOR OCTAVIUS DEV ENVIRONMENT"
echo "================================================="

# Update all packages
echo "UPDATING PACKAGES..." 
sudo apt-get update 
sudo apt-get upgrade -y 

# MySQL 
echo "INSTALLING MYSQL" 
sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password root'
sudo apt-get update
sudo apt-get -y install mysql-server-5.5 build-essential libssl-dev git curl nodejs qt4-dev-tools libqt4-dev libqt4-core libqt4-gui libmysqlclient-dev 

echo "SETTING UP MYSQL DEFAULT USER (vagrant:vagrant)" 
if [ ! -f /var/log/databasesetup ];
then
    echo "CREATE USER 'vagrant'@'%' IDENTIFIED BY 'vagrant'" | mysql -u root --password=root
    echo "GRANT ALL ON *.* TO 'vagrant'@'%'" | mysql -u root --password=root
    echo "FLUSH PRIVILEGES" | mysql -u root --password=root

    touch /var/log/databasesetup
fi

# TODO: Config MySQL to bind to * instead of localhost 


# PostgreSQL
echo "INSTALLING POSTGRESQL"
sudo apt-get -y install libpq-dev postgresql postgresql-contrib

# Set Postgres password from command line
echo "SETTING UP POSTGRES DEFAULT USER (vagrant:vagrant)" 
sudo -u postgres psql -c "CREATE ROLE vagrant PASSWORD 'vagrant' SUPERUSER CREATEDB CREATEROLE INHERIT LOGIN;"

# TODO Edit files:
# /etc/postgresql/9.3/main/pg_hba.conf
# host all all 0.0.0.0/0 trust

# /etc/postgresql/9.3/main/postgresql.conf
# listen_address = '*'


# Node
echo "INSTALLING NODE/NPM"
sudo apt-get install -y nodejs-legacy npm 

echo "INSTALLING LOCALTUNNEL" 
sudo npm install -g localtunnel



# PhantomJS Installation 
echo "INSTALLING PHANTOMJS"
wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-1.9.8-linux-x86_64.tar.bz2
tar -xvf phantomjs-1.9.8-linux-x86_64.tar.bz2
sudo cp phantomjs-1.9.8-linux-x86_64/bin/phantomjs /usr/local/bin/
rm -rf phantomjs-1.9.8-linux-x86_64 phantomjs-1.9.8-linux-x86_64.tar.bz2


echo "INSTALLING RUBY AND RAILS..."
# Add trusted GPG key for RVM to work
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

# The other scripts will install the rest of Ruby and Rails.. 

