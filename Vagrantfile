# -*- mode: ruby -*-
# vi: set ft=ruby :


servers=[
  {
    :hostname => "kube1.gokul.com",
	:box => "gokulc/CentOS_7",
    :ip => "192.168.56.51"
  },
  {
    :hostname => "kube2.gokul.com",
	:box => "gokulc/CentOS_7",
    :ip => "192.168.56.52"
  },
  {
    :hostname => "kube3.gokul.com",
	:box => "gokulc/CentOS_7",
    :ip => "192.168.56.53"
  }

]
Vagrant.configure("2") do |config|
  config.vm.box = "gokulc/CentOS_7"
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = false
  config.hostmanager.manage_guest = true
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = true
  servers.each do |machine|
        config.vm.define machine[:hostname] do |node|
            node.vm.box = machine[:box]
            node.vm.hostname = machine[:hostname]
            node.vm.network "private_network", ip: machine[:ip]
        end
    end
end
