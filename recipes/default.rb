#
# Cookbook Name:: ssh_tunnel
# Recipe:: default
#

include_recipe 'runit'

runit_service node[:ssh_tunnel][:name] do
  default_logger true
end

chef_gem "chef-rewind"
require 'chef/rewind'

include_recipe "monit"

# don't write the default monit template
rewind "template[/etc/monit/monitrc]" do
  action :nothing
  notifies :restart, resources(:service => "monit"), :delayed
end

template "#{node[:ssh_tunnel][:monit_conf_d]}/#{node[:ssh_tunnel][:name]}" do
  source "ssh_tunnel.monitrc.erb"
  mode 0644
  variables({
              :name => node[:ssh_tunnel][:name],
              :pid_file => node[:ssh_tunnel][:pid_file],
              :tunnel_direction => node[:ssh_tunnel][:tunnel_direction],
              :connect_port => node[:ssh_tunnel][:connect_port],
            })
  notifies :restart, resources(:service => "monit"), :delayed
end

