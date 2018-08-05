id = 'nginx-amplify'
include_recipe "#{id}::repository"

node[id]['packages'][node['platform_family']].each do |pkg_name|
  package pkg_name do
    action :upgrade
  end
end
