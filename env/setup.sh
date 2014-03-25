# Make sure we get the latest suorces
apt-get update

# Prevent installers from asking too much shit
export DEBIAN_FRONTEND=noninteractive
apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" upgrade
apt-get -y install vim
apt-get -y install fail2ban
