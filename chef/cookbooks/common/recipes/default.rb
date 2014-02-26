#
# Cookbook Name:: common
# Recipe:: default
#
# Copyright (c) 2014 Botond Dani <botond.dani@gmail.com>
#

node['default_packages'].each do |pkg|
	package pkg
end