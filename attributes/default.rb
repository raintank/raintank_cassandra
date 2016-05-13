default[:chef_cassandra][:cluster_name] = "Test Cluster"
default[:chef_cassandra][:num_tokens] = 256
default[:chef_cassandra][:seeds] = []
default[:chef_cassandra][:listen_interface] = "eth0"
default[:chef_cassandra][:rpc_address] = "0.0.0.0"
default[:chef_cassandra][:broadcast_rpc_address] = node.ipaddress
default[:chef_cassandra][:snitch] = "SimpleSnitch"
default[:chef_cassandra][:concurrent_reads] = 8 * node.cpu.total
default[:chef_cassandra][:concurrent_writes] = 8 * node.cpu.total
default[:chef_cassandra][:search] = "tags:cassandra AND chef_environment:#{node.chef_environment}"
default[:chef_cassandra][:cassandra_disk] = "/dev/sdb"
default[:chef_cassandra][:cassandra_commit_disk] = "/dev/sdc"
default[:chef_cassandra][:cron_mailto] = "root@localhost"

default[:java][:install_flavor] = "oracle"
default[:java][:jdk_version] = "8"
default[:java][:oracle][:accept_oracle_download_terms] = true