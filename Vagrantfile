# -*- mode: ruby -*-
# vi: set ft=ruby :

#-----------------------------------------------------------------------------
# Application Configuration
#-----------------------------------------------------------------------------
ENV['CHEF_ENV'] ||= "dev"

app_config = {
    "name"              => "vnpp",
    "box"               => "precise64",
    "box_url"           => "http://files.vagrantup.com/precise64.box",
    "guest_ip"          => "33.33.33.12",
    "memory"            => "1024",
    "hostname"          => "vnpp.dev",
    "sync_folder"       => "/home/vagrant/vnpp",
    "docroot"           => "/home/vagrant/vnpp",
    "chef_version"      => "11.8.0",
    "chef_env"          => ENV['CHEF_ENV']
}

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.require_plugin "vagrant-berkshelf"
Vagrant.require_plugin "vagrant-hostmanager"
Vagrant.require_plugin "vagrant-omnibus"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  #-----------------------------------------------------------------------------
  # Omnibus Plugin
  #-----------------------------------------------------------------------------
  if Vagrant.has_plugin?("vagrant-omnibus") then
    config.omnibus.chef_version = app_config["chef_version"]
  end


  #-----------------------------------------------------------------------------
  # Berkshelf Plugin
  #-----------------------------------------------------------------------------
  if Vagrant.has_plugin?("vagrant-berkshelf") then
    config.berkshelf.enabled = true
  end


  #-----------------------------------------------------------------------------
  # Hostmanager Plugin
  #-----------------------------------------------------------------------------
  if Vagrant.has_plugin?("vagrant-hostmanager") then
    config.hostmanager.enabled = true
    config.hostmanager.manage_host = true
    config.hostmanager.ignore_private_ip = false
    config.hostmanager.include_offline = false

    config.vm.provision :hostmanager
  end


  #-----------------------------------------------------------------------------
  # Vagrant Box
  #-----------------------------------------------------------------------------
  config.vm.box = app_config["box"]
  config.vm.box_url = app_config["box_url"]
  config.vm.hostname = app_config["hostname"]


  #-----------------------------------------------------------------------------
  # Networking
  #-----------------------------------------------------------------------------
  config.vm.network :private_network, ip: app_config["guest_ip"]


  #-----------------------------------------------------------------------------
  # SSH
  #-----------------------------------------------------------------------------
  config.ssh.forward_agent = true


  #-----------------------------------------------------------------------------
  # Synced Folders
  #-----------------------------------------------------------------------------
  # NFS sync folder
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.synced_folder ".", app_config["sync_folder"], type: "nfs"


  #-----------------------------------------------------------------------------
  # VirtualBox Provider
  #-----------------------------------------------------------------------------
  config.vm.provider :virtualbox do |vb|
    vb.gui = false
    vb.customize ["modifyvm", :id, "--memory", app_config["memory"]]
    vb.customize ["modifyvm", :id, "--name", app_config["name"]]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end


  #-----------------------------------------------------------------------------
  # Chef-Solo Provision
  #-----------------------------------------------------------------------------
  config.vm.provision "chef_solo" do |chef|
    VAGRANT_JSON = JSON.parse(Pathname(__FILE__).dirname.join('chef/nodes', 'vagrant.json').read)

    chef.roles_path = "./chef/roles"
    chef.data_bags_path = "./chef/data_bags"
    chef.environments_path = "./chef/environments"
    chef.environment = app_config['env']
    chef.log_level = "debug"

    chef.run_list = VAGRANT_JSON.delete('run_list')
    chef.json = VAGRANT_JSON.merge!({
        'app' => {
            'doc_root' => app_config['docroot']
        }
    })
  end

end
