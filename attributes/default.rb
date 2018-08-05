id = 'nginx-amplify'

default[id]['repository']['uri'] = case node['platform_family']
                       when 'debian' then "http://packages.amplify.nginx.com/#{node['platform']}/"
                       end
default[id]['repository']['distribution'] = node['lsb']['codename']
default[id]['repository']['signing_key'] = 'http://nginx.org/keys/nginx_signing.key'

default[id]['upgrade'] = false
default[id]['packages']['debian'] = %w(
  nginx-amplify-agent
)
