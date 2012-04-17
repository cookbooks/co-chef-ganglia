directory "/etc/ganglia-webfrontend"

case node[:platform]
when "ubuntu", "debian"
  package "ganglia-webfrontend"

  link "/etc/apache2/sites-enabled/ganglia" do
    to "/etc/ganglia-webfrontend/apache.conf"
    notifies :restart, "service[apache2]"
    not_if node[:ganglia][:apache][:write_config_file]
  end

when "redhat", "centos", "fedora"
  package "httpd"
  package "php"
  include_recipe "ganglia::source"
  include_recipe "ganglia::gmetad"

  execute "copy web directory" do
    command "cp -r web /var/www/html/ganglia"
    creates "/var/www/html/ganglia"
    cwd "/usr/src/ganglia-#{node[:ganglia][:version]}"
  end
end

# If applicable, write an apache config file for Ganglia
if node[:ganglia][:apache][:write_config_file]
  template "/etc/apache2/sites-available/ganglia" do
    source  "apache.conf.erb"
    owner   "root"
    group   "root"
    mode    0644
    action  :create
    variables(
      :config => node[:ganglia][:apache]
    )
  end

  # Make sure apache listens on the specified port
  bash "update apache ports.conf" do
    user  "root"
    cwd   "/etc/apache2"
    code <<-EOH
      echo "" >> ports.conf
      echo "Listen #{node[:ganglia][:apache][:vhost_port]}" >> ports.conf
      echo "NameVirtualHost *:#{node[:ganglia][:apache][:vhost_port]}" >> ports.conf
    EOH
    not_if "grep 'Listen #{node[:ganglia][:apache][:vhost_port]}' ports.conf"
  end
end

service "apache2" do
  service_name "httpd" if platform?( "redhat", "centos", "fedora" )
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end
