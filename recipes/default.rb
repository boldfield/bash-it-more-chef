#
# Cookbook Name:: bash-it-more
# Recipe:: default
#
# Copyright (C) 2016 Brian Oldfield
#
# All rights reserved - Do Not Redistribute
#
case node.platform_family
when 'mac_os_x'
  home_base = '/Users'
  pro_file = '.bash_profile'
else
  home_base = '/home'
  pro_file = '.bashrc'
end


git node['bash-it']['install']['dir'] do
  repository node['bash-it']['install']['src']['repository']
  revision node['bash-it']['install']['src']['revision']
  action :checkout
end

unless node['bash-it']['user'].nil?
  group = case node.platform_family
          when 'mac_os_x'
            'staff'
          else
            node['bash-it']['user']
          end

  template "#{home_base}/#{node['bash-it']['user']}/#{pro_file}" do
    source 'bash_profile.erb'
    owner node['bash-it']['user']
    group group
    mode 0550
    variables(
      base_dir: node['bash-it']['install']['dir'],
      theme: node['bash-it']['theme'],
      git: node['bash-it']['git'],
      irc: node['bash-it']['irc'],
      todo: node['bash-it']['todo'],
      scm_check: node['bash-it']['scm_check'],
    )
  end

  bash_it_more_modules node['bash-it']['user'] do
    install_dir "#{node['bash-it']['install']['dir']}/plugins"
    type 'plugin'
    items node['bash-it']['plugins']
  end
end
