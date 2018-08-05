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
end
