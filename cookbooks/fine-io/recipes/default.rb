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
include_recipe "fine-io::deployer"

# Install the Dream Stack
include_recipe "nodejs"
