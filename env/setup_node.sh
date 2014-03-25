if hash node 2>/dev/null; then
  echo "NodeJS is already installed, I am not doing that again."
  exit 0
fi

# Setting up NodeJS:
apt-get -y install python-software-properties python g++ make
add-apt-repository -y ppa:chris-lea/node.js
apt-get update
apt-get -y install nodejs