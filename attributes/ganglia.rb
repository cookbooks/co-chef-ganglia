default[:ganglia][:version] = "3.1.7"
default[:ganglia][:uri] = "http://sourceforge.net/projects/ganglia/files/ganglia%20monitoring%20core/3.1.7/ganglia-3.1.7.tar.gz/download"
default[:ganglia][:checksum] = "bb1a4953"

default[:ganglia][:server_role] = "ganglia"

# Cluster Information
default[:ganglia][:cluster][:name]    = "unspecified"
default[:ganglia][:cluster][:owner]   = "unspecified"
default[:ganglia][:cluster][:latlong] = "unspecified"
default[:ganglia][:cluster][:url]     = "unspecified"

# Multicast send/receive config
default[:ganglia][:multicast][:send_channel][:mcast_join] = "239.2.11.71"
default[:ganglia][:multicast][:send_channel][:port] = "8649"
default[:ganglia][:multicast][:send_channel][:ttl] = 1

default[:ganglia][:multicast][:recv_channel][:mcast_join] = "239.2.11.71"
default[:ganglia][:multicast][:recv_channel][:port] = "8649"
default[:ganglia][:multicast][:recv_channel][:bind] = "239.2.11.71"

# Unicast send/receive config
default[:ganglia][:unicast][:enable] = false
default[:ganglia][:unicast][:port] = "8649"
default[:ganglia][:unicast][:ttl] = 1

# A list if chef node names that are in a cluster. This is 
# ignored if Unicast is used.
default[:ganglia][:cluster_nodes] = []

# Some attributes used to write an apache config file
default[:ganglia][:apache][:write_config_file] = true
default[:ganglia][:apache][:vhost_addr] = "*"
default[:ganglia][:apache][:vhost_port] = "80"
default[:ganglia][:apache][:server_admin] = "root@localhost"
default[:ganglia][:apache][:error_log] = "/var/log/apache2/error.log"
default[:ganglia][:apache][:log_level] = "warn"
default[:ganglia][:apache][:alias] = "/ganglia"
# Setting `allow_from` will restrict the addresses from which Ganglia
# can be viewed. E.G. setting to "127.0.0.0/255.0.0.0 ::1/128" will
# only allow local connections
default[:ganglia][:apache][:allow_from] = nil

