#!/usr/bin/env ruby
#^syntax detection

site :opscode

# default cookbooks for Ubuntu Platform
cookbook 'locale'
cookbook 'apt', '2.3.4'
cookbook 'ohai', '1.1.8'
cookbook 'build-essential', '1.4.2'
cookbook 'openssl', '1.1.0'
cookbook 'ntp', '1.5.4'
cookbook 'vim', '1.1.2'
cookbook 'git', '2.9.0'
cookbook 'xml', '1.2.0'

# application specific cookbooks
cookbook 'common',
    path: './chef/cookbooks/common'