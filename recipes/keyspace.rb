#
# Cookbook Name:: chef_cassandra
# Recipe:: keyspace
#
# Copyright (C) 2016 Raintank, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

cookbook_file '/tmp/cassandra_keyspace.cql' do
  source "cassandra_keyspace.cql"
  action :create
end

# set up kairosdb schema when cassandra starts.
bash 'init_cassandra_keyspace' do
  cwd "/tmp"
  code <<-EOH
    echo "grep for cassandra"
    ps ax | grep cassandra | grep java
    LCOUNT=0
    COUNT=0
    while [ $LCOUNT -le 50 ]; do
      if netstat -nlt | grep -q 9042; then
	LCOUNT=51
	echo "listening on 9042"
      else
	LCOUNT=$((LCOUNT + 1))
	sleep 1
      fi
    done
    while [ $COUNT -le 10 ]; do
      if cqlsh -e 'desc keyspaces'; then
        cqlsh -f /tmp/cassandra_keyspace.cql
        exit $?
      else
        COUNT=$((COUNT + 1))
        sleep 10
      fi
    done
    exit 1
    EOH
  action :nothing
  subscribes :run, 'cookbook_file[/tmp/cassandra_keyspace.cql]', :delayed
end

