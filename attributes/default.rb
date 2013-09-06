# Used as service name for runit etc
default[:ssh_tunnel][:name] = 'ssh_tunnel'

# host to ssh to
default[:ssh_tunnel][:ssh_hostname] = '127.0.0.1'

# port to ssh to
default[:ssh_tunnel][:ssh_port] = 22

# user to ssh as
default[:ssh_tunnel][:ssh_user] = 'root'

# private key to use
default[:ssh_tunnel][:ssh_private_key_file] = "~#{node[:ssh_tunnel][:ssh_user]}/.ssh/id_rsa"

# port that is going to be forwarded
default[:ssh_tunnel][:connect_port] = '31337'

# host on the remote side (or local side for reverse tunnel) that :connect_port will forward to
default[:ssh_tunnel][:forward_host] = '127.0.0.1'

# the port on :forward_host that :connect_port will be forwarded to
default[:ssh_tunnel][:forward_port] = '80'

# FWD, REV or DUAL- what kind of tunnel. DUAL is both
default[:ssh_tunnel][:tunnel_direction] = 'FWD'

# path to ssh
default[:ssh_tunnel][:ssh_cmd] = '/usr/bin/ssh'

# skip hostkey auth, best to leave this false
default[:ssh_tunnel][:skip_hostkey_auth] = false

# path to ssh known hosts file if :skip_hostkey_auth is false
default[:ssh_tunnel][:ssh_known_hosts] = "~#{node[:ssh_tunnel][:ssh_user]}/.ssh/known_hosts"

# use runit's pid file for monit
default[:ssh_tunnel][:pid_file] = "/etc/service/#{node[:ssh_tunnel][:name]}/supervise/pid"

default[:ssh_tunnel][:monit_conf_d] = '/etc/monit/conf.d'
