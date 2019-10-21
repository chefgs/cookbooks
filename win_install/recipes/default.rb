#
# Cookbook:: win_install
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

node.default['sql_server']['accept_eula'] = 'true'
include_recipe 'sql_server::client'
