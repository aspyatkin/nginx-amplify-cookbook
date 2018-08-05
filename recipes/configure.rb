id = 'nginx-amplify'

src_file = '/etc/amplify-agent/agent.conf.default'
target_file = '/etc/amplify-agent/agent.conf'
secret = ::ChefCookbook::Secret::Helper.new(node)

service 'amplify-agent' do
  action :enable
end

execute 'configure amplify-agent' do
  command "sed \"s/api_key.*$/api_key = ${NGINX_AMPLIFY_API_KEY}/;s/#stub_status.*$/stub_status = ${NGINX_AMPLIFY_STUB_STATUS}/\" #{src_file} > #{target_file}"
  action :run
  environment(
    'NGINX_AMPLIFY_API_KEY' => secret.get('nginx-amplify:api_key'),
    'NGINX_AMPLIFY_STUB_STATUS' => "http:\\/\\/127.0.0.1:#{node['nginx']['status']['port']}\\/nginx_status"
  )
  creates target_file
  notifies :restart, 'service[amplify-agent]', :immediately
end
