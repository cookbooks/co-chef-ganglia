default[:ganglia][:version] = "3.1.7"
default[:ganglia][:uri] = "http://sourceforge.net/projects/ganglia/files/ganglia%20monitoring%20core/3.1.7/ganglia-3.1.7.tar.gz/download"
default[:ganglia][:checksum] = "bb1a4953"

default[:ganglia][:unicast] = false
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
default[:ganglia][:unicast][:port] = "8649"
default[:ganglia][:unicast][:ttl] = 1


# A list if chef node names that are in a cluster. This is 
# ignored if Unicast is used.
default[:ganglia][:cluster_nodes] = []
