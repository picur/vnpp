#
# Cookbook Name:: common
# Recipe:: php55
#
# Copyright (c) 2014 Botond Dani <botond.dani@gmail.com>
#

package "python-software-properties"

execute "install-php-ppa" do
    user "root"
    command "add-apt-repository ppa:ondrej/php5"
    notifies :run, "execute[apt-get update]", :immediately
end