##
# Installer script for mysql-5.6.
##

# First check if it is already set up or not.
if hash mysql 2>/dev/null; then
  echo "MySQL is already installed, I am not doing that again."
  exit 0
fi

# Go to a crap folder
cd /tmp

# Install dependency
apt-get install libaio1

# Set up MySQL 5.6 package
wget http://dev.mysql.com/get/Downloads/MySQL-5.6/mysql-5.6.16-debian6.0-i686.deb
dpkg -i mysql-5.6.16-debian6.0-i686.deb

# Create user & group for mysql
groupadd mysql
useradd -r -g mysql mysql

# Give ownership to mysql
cd /opt/mysql/server-5.6
chown -R mysql .
chgrp -R mysql .

# Set the DB up
scripts/mysql_install_db --user=mysql

# Fix ownership definitively
chown -R root .
chown -R mysql data

# Install the daemon
cp support-files/mysql.server /etc/init.d/mysqld
update-rc.d mysqld defaults

# Add MySQL bin to PATH
echo "PATH+=\":/opt/mysql/server-5.6/bin\"" >> /etc/profile

service mysqld start
