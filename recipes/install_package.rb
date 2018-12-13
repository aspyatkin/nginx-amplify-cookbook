id = 'nginx-amplify'
include_recipe "#{id}::repository"

node[id]['packages'].each do |pkg_name|
  package pkg_name do
    action :install
  end
end
