# Setup the hostname
hostname = 'apps.fine.io'

file '/etc/hostname' do
	content "#{hostname}\n"
end

service 'hostname' do
	action :restart
end

# Build the hosts file
template "/etc/hosts" do
	source "hosts.erb"
	owner "root"
	group "root"
	mode 0644
	variables(
		:hosts => {
			'127.0.0.1'=>"#{hostname}",
			'176.58.124.92'=>"cloud01"
		}
	)
end

# Install build-essential
package "build-essential" do
	action :install
end

# Create the deployer user
user "deployer" do
	comment "Deployer user"
	uid 1000
	home "/home/deployer"
	shell "/bin/bash"
	password "$1$TyoDsgTM$C0wn3bHbsdat7H2i7ALgw/"
end

directory "/home/deployer" do
  owner "deployer"
  group "deployer"
  mode 0700
  action :create
end

# Authorized keys
authorized_keys_for "deployer"