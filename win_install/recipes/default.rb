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


# Disable Windows Server IE Enhanced Security Feature
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}' do
  values [{
    name: 'IsInstalled',
    type: :dword,
    data: 0
  }]
  action :create
end

#node.default['sql_server']['accept_eula'] = 'true'
#include_recipe 'sql_server::client'
