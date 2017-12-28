name 'chef_auto_camera'
maintainer 'Daniel Jennings'
maintainer_email 'daniel.j.jennings@gmail.com'
license 'Apache-2.0'
description 'Installs RPi Cam Web Interface for use on Raspberry Pi'
long_description 'Installs RPi Cam Web Interface for use on Raspberry Pi'
version '0.1.0'
chef_version '>= 12.1' if respond_to?(:chef_version)
depends 'apt'
depends 'git'
supports 'debian'

issues_url 'https://github.com/JenningsDaniel/chef_auto_camera/issues'
source_url 'https://github.com/JenningsDaniel/chef_auto_camera'
