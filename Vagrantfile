# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|

  config.vm.box = 'precise64'
  config.vm.box_url = 'http://files.vagrantup.com/precise64.box'
  config.vm.forward_port 80, 8081
  config.vm.forward_port 9200, 92000
  config.vm.network :hostonly, "192.168.50.4"

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "_build/manifests"
	puppet.manifest_file = "default.pp"
	puppet.module_path = "_build/modules"
  end
end