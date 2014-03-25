# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

my_name = "blog_precise32"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise32"
  
  # Use a newer box image 
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-i386-vagrant-disk1.box"
  
  # Hacky way of defining a name for a machine
  config.vm.define my_name do |t|
  end

  config.vm.synced_folder "./", "/home/vagrant/blog"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network :forwarded_port, guest: 3001, host: 3001
  
  config.vm.provision "shell", path: "./env/setup.sh"
  config.vm.provision "shell", path: "./env/setup_mysql.sh"
  config.vm.provision "shell", path: "./env/setup_node.sh"
  config.vm.provision "shell", path: "./env/setup_ruby_rails.sh"

  config.vm.provider :virtualbox do |vb|
     vb.name = my_name

     # Use VBoxManage to customize the VM. For example to change memory:
     vb.customize ["modifyvm", :id, "--memory", "1024"]
  end
  
end
