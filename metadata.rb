name 'nginx-amplify'
maintainer 'Alexander Pyatkin'
maintainer_email 'aspyatkin@gmail.com'
license 'MIT'
description 'Install Nginx Amplify agent'
long_description ::IO.read(::File.join(::File.dirname(__FILE__), 'README.md'))
version '2.0.0'

scm_url = 'https://github.com/aspyatkin/nginx-amplify-cookbook'
source_url scm_url if respond_to?(:source_url)
issues_url "#{scm_url}/issues" if respond_to?(:issues_url)

depends 'line', '>= 2.9.0'
