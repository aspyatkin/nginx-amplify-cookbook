id = 'nginx-amplify'

include_recipe \
  "#{id}::#{node[id]['upgrade'] ? 'upgrade' : 'install'}_package"

include_recipe "#{id}::configure"
