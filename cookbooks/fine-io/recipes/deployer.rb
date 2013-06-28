
# Create the deployer user
user "deployer" do
	comment "Deployer user"
	uid 1000
	home "/home/deployer"
	shell "/bin/bash"
	password "$1$TyoDsgTM$C0wn3bHbsdat7H2i7ALgw/"
end

group "deployer" do
	action :create
	members "deployer"
	append true
end

directory "/home/deployer" do
  owner "deployer"
  group "deployer"
  mode 0700
  action :create
end

directory "/home/deployer/tools" do
	owner "deployer"
	group "deployer"
	mode 0700
	action :create
end

# Authorized keys
authorized_keys_for "deployer"

# The bashrc file
template "/home/deployer/tools/motd" do
	source "motd.erb"
	owner "deployer"
	group "deployer"
	mode 0777
end

template "/home/deployer/.profile" do
	source "profile.erb"
	owner "deployer"
	group "deployer"
	mode 0700
end