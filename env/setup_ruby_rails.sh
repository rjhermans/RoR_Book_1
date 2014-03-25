
# Which version to use?
ruby_version=2.1.1

# First check if it is already set up or not.
if [ "$(ruby -e 'print RUBY_VERSION')" == $ruby_version ]; then
  echo "Ruby $ruby_version is already installed, I am not doing that again."
else
  su vagrant
  \curl -sSL https://get.rvm.io | bash -s stable --rails
  source /usr/local/rvm/scripts/rvm
  rvm install $ruby_version
  rvm --create use $ruby_version@achieved
  rvm --default use $ruby_version@achieved
fi

# Install the bundle
cd /home/vagrant/blog
bundle install