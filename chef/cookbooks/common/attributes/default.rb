#
# Cookbook Name:: common
# Attribute:: default
#
# Copyright (c) 2014 Botond Dani <botond.dani@gmail.com>
#


case node['platform_family']
when 'debian'
	default['default_packages'] = %w{ htop }
end