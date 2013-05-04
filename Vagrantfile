# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|

  config.vm.box = 'precise64'
  config.vm.box_url = 'http://files.vagrantup.com/precise64.box'
  # Web server
  config.vm.forward_port 80, 8081
  # CouchDB web interface
  config.vm.forward_port 5984, 5985
  # Elasticsearch
  config.vm.forward_port 9200, 9201
  # Mongodb
  config.vm.forward_port 27017, 27018
  # Mongodb web interface
  config.vm.forward_port 28017, 28018
  # This line is optional, comment out to access at localhost:8081 or change the IP if you need more
  # than one li3_vagrant box running at once.
  config.vm.network :hostonly, "192.168.50.4"

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "_build/manifests"
	puppet.manifest_file = "default.pp"
	puppet.module_path = "_build/modules"
  end
end