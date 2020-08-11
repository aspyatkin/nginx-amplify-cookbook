resource_name :nginx_amplify_agent

default_action :setup

property :api_key, String, required: true
property :stub_status, [String, NilClass], default: nil
property :upgrade, [TrueClass, FalseClass], default: false

action :setup do
  case node['platform_family']
  when 'debian'
    apt_repository 'nginx-amplify' do
      uri "http://packages.amplify.nginx.com/#{node['platform']}/"
      distribution node['lsb']['codename']
      components ['amplify-agent']
      key 'http://nginx.org/keys/nginx_signing.key'
      action :add
    end
  else
    raise "Unsupported platform #{node['platform_family']}"
  end

  package 'nginx-amplify-agent' do
    action (new_resource.upgrade ? 'upgrade' : 'install').to_sym
  end

  conf_file = '/etc/amplify-agent/agent.conf'

  file conf_file do
    content lazy { ::IO.binread('/etc/amplify-agent/agent.conf.default') }
    action :create_if_missing
  end

  replace_or_add 'set Amplify Agent API key' do
    path conf_file
    pattern /^api_key =.*$/
    line "api_key = #{new_resource.api_key}"
    replace_only true
    notifies :restart, 'service[amplify-agent]', :delayed
  end

  unless new_resource.stub_status.nil?
    replace_or_add 'set Amplify Agent Nginx stub_status' do
      path conf_file
      pattern /^#?stub_status =.*$/
      line "stub_status = #{new_resource.stub_status}"
      replace_only true
      notifies :restart, 'service[amplify-agent]', :delayed
    end
  end

  service 'amplify-agent' do
    action [:enable, :start]
  end
end
