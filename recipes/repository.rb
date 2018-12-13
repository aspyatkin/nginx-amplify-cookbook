id = 'nginx-amplify'

case node['platform_family']
when 'debian'
  include_recipe 'apt::default'

  apt_repository 'nginx-amplify' do
    uri node[id]['repository']['uri']
    distribution node[id]['repository']['distribution']
    components ['amplify-agent']
    key node[id]['repository']['signing_key']
    action :add
  end
when 'rhel', 'amazon'
  yum_repository 'nginx-amplify' do
    baseurl node[id]['repository']['uri']
    gpgkey node[id]['repository']['signing_key']
    action :create
  end
end
