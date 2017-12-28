# # encoding: utf-8

# Inspec test for recipe chef_auto_camera::default

describe directory('/home/vagrant/RPi_Cam_Web_Interface') do
  it { should exist }
  its('mode') { should cmp '0755' }
  its('owner') { should eq 'vagrant' }
  its('group') { should eq 'vagrant' }
end

describe file('/home/vagrant/RPi_Cam_Web_Interface/config.txt') do
  it { should exist }
  its('mode') { should cmp '0755' }
  its('owner') { should eq 'vagrant' }
  its('group') { should eq 'vagrant' }
  its('content') { should match(/rpicamdir="html"/) }
  its('content') { should match(/webserver="nginx"/) }
  its('content') { should match(/webport="80"/) }
  its('content') { should match(/user="user"/) }
  its('content') { should match(/webpassword="pwd"/) }
  its('content') { should match(/autostart="yes"/) }
  its('content') { should match(/jpglink="no"/) }
  its('content') { should match(/phpversion="7"/) }
end

describe file('/etc/raspimjpeg') do
  it { should exist }
  its('owner') { should eq 'root' }
  its('group') { should eq 'root' }
end
