name 'nginx-amplify'
maintainer 'Alexander Pyatkin'
maintainer_email 'aspyatkin@gmail.com'
license 'MIT'
description 'Install Nginx Amplify agent'
long_description ::IO.read(::File.join(::File.dirname(__FILE__), 'README.md'))
version '1.1.0'

provides 'nginx-amplify::default'
recipe 'nginx-amplify::default', 'Install or upgrade Nginx Amplify agent'

provides 'nginx-amplify::repository'
recipe 'nginx-amplify::repository', 'Add nginx-amplify repository to a system'

provides 'nginx-amplify::install_package'
recipe 'nginx-amplify::install_package', 'Install Nginx Amplify agent'

provides 'nginx-amplify::upgrade_package'
recipe 'nginx-amplify::upgrade_package', 'Install the latest version of Nginx Amplify agent'

scm_url = 'https://github.com/aspyatkin/nginx-amplify-cookbook'
source_url scm_url if respond_to?(:source_url)
issues_url "#{scm_url}/issues" if respond_to?(:issues_url)

depends 'apt'
depends 'secret', '~> 1.0.0'

chef_version '>= 12'
supports 'debian', '>= 8.0'
supports 'ubuntu', '>= 16.04'
supports 'centos', '>= 7.0'
supports 'redhat', '>= 7.0'
supports 'amazon'
