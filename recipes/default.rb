#
# Cookbook:: chef_auto_camera
# Recipe:: default
#

include_recipe 'apt'

git_client 'default' do
  action :install
end

git node['chef_auto_camera']['RPi_Cam_Web_Interface_Home'] do
  repository 'git://github.com/silvanmelchior/RPi_Cam_Web_Interface.git'
  action :checkout
  user node['chef_auto_camera']['owner']
  group node['chef_auto_camera']['group']
end

template "#{node['chef_auto_camera']\
    ['RPi_Cam_Web_Interface_Home']}/config.txt" do
  source 'config.txt.erb'
  owner node['chef_auto_camera']['owner']
  group node['chef_auto_camera']['group']
  mode '0755'
  variables(
    camdir: node['chef_auto_camera']['rpicamdir'],
    wserver: node['chef_auto_camera']['webserver'],
    wsport: node['chef_auto_camera']['webport'],
    user: node['chef_auto_camera']['user'],
    pwd: node['chef_auto_camera']['webpassword'],
    autostart: node['chef_auto_camera']['autostart'],
    jpglink: node['chef_auto_camera']['jpglink'],
    phpversion: node['chef_auto_camera']['phpversion']
  )
end

execute 'install_RPi_Cam' do
  command "#{node['chef_auto_camera']\
    ['RPi_Cam_Web_Interface_Home']}/install.sh q"
  cwd node['chef_auto_camera']['RPi_Cam_Web_Interface_Home']
  live_stream true
end
