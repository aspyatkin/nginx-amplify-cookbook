id = 'nginx-amplify'

default[id]['repository']['uri'] = \
  case node['platform_family']
    when 'debian' then "http://packages.amplify.nginx.com/#{node['platform']}/"
    when 'rhel' then 'http://packages.amplify.nginx.com/centos/7/$basearch'
    when 'amazon' then 'http://packages.amplify.nginx.com/amzn/latest/$basearch'
  end
default[id]['repository']['distribution'] = node['lsb']['codename']
default[id]['repository']['signing_key'] = 'http://nginx.org/keys/nginx_signing.key'

default[id]['upgrade'] = false
default[id]['packages'] = %w(
  nginx-amplify-agent
)
