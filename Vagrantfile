# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.vm.provider :virtualbox do |vm, override|
    override.vm.box_url = "http://files.vagrantup.com/precise64.box"
  end
  config.vm.provider :vmware_fusion do |vm, override|
    override.vm.box_url = "http://files.vagrantup.com/precise64_vmware_fusion.box"
  end

  config.vm.hostname = 'vagrant'
  config.vm.network :forwarded_port, guest: 80, host: 8000

  config.vm.synced_folder "salt/roots/", "/srv/"
  config.vm.provision :salt do |salt|
    salt.minion_config = 'salt/minion_vagrant.conf'
    salt.verbose = true
    salt.install_type = 'stable'
  end
end
