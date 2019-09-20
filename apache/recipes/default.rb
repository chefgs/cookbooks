#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.
package 'Install Apache' do
  case node['platform']
  when 'redhat', 'centos'
    package_name 'httpd'
  when 'ubuntu', 'debian'
    package_name 'apache2'
  end
end

directory '/tmp/cheftemp'

file '/tmp/cheftemp/chef.txt' do
  content 'File is created by Chef file resource'
  mode '0755'
  only_if { ::File.directory?('/tmp/cheftemp') }
end

group 'chefusers'

user 'bob' do
  group 'chefusers'
end
