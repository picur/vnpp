#
# Cookbook Name:: common
# Recipe:: app_config
#
# Copyright (c) 2014 Botond Dani <botond.dani@gmail.com>
#

nginx_site "default" do
	enable false
end

template "#{node['nginx']['dir']}/sites-available/vnpp.conf" do
	source "nginx_fpm.erb"
end

nginx_site "vnpp.conf"