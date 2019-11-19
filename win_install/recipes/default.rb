#
# Cookbook:: win_install
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.
#

unless platform?('windows') 
  Chef::Log.info('Cookbook created for Windows OS')
  return 0
end

node.default['sql_server']['accept_eula'] = 'true'
include_recipe 'sql_server::client'
