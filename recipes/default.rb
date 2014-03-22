#
# Cookbook Name:: rackspace_openssh
# Recipe:: default
#
# Copyright 2008-2013 Opscode, Inc.
# Copyright 2014, Rackspace, US Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

def listen_addr_for(interface, type)
  interface_node = node['network']['interfaces'][interface]['addresses']
  interface_node.select { |address, data| data['family'] == type }.keys[0]
end

node['rackspace_openssh']['config']['package_name'].each do |name|
  package name
end

service 'ssh' do
  service_name node['rackspace_openssh']['config']['service_name']
  supports value_for_platform(
    'debian' => { 'default' => [:restart, :reload, :status] },
    'ubuntu' => {
      'default' => [:restart, :reload, :status]
    },
    'centos' => { 'default' => [:restart, :reload, :status] },
    'redhat' => { 'default' => [:restart, :reload, :status] },
    'default' => { 'default' => [:restart, :reload] }
  )
  action [:enable, :start]
end

template '/etc/ssh/ssh_config' do
  cookbook node['rackspace_openssh']['templates_cookbook']['ssh_config']
  source 'ssh_config.erb'
  mode   '0644'
  owner  'root'
  group  node['rackspace_openssh']['config']['rootgroup']
  variables (cookbook_name: cookbook_name)
end

if node['rackspace_openssh']['config']['server']['ListenInterfaces']
  listen_addresses = Array.new.tap do |a|
    node['rackspace_openssh']['config']['server']['ListenInterfaces'].each_pair do |interface, type|
      a << listen_addr_for(interface, type)
    end
  end

  node.set['rackspace_openssh']['config']['server']['ListenAddress'] = listen_addresses
end

template '/etc/ssh/sshd_config' do
  cookbook node['rackspace_openssh']['templates_cookbook']['sshd_config']
  source 'sshd_config.erb'
  mode   node['rackspace_openssh']['config']['config_mode']
  owner  'root'
  group  node['rackspace_openssh']['config']['rootgroup']
  notifies :restart, 'service[ssh]'
  variables (cookbook_name: cookbook_name)
end
