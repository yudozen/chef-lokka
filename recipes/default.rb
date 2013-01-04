#
# Cookbook Name:: lokka
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
gem_package "bundler" do
        action :install
        options "--no-rdoc --no-ri"
end

# for lokka
package "sqlite-devel" do
	action :install
end

#$ git clone git://github.com/komagata/lokka.git
git "/home/yudozen/tmp/lokka" do
	repository "git://github.com/komagata/lokka.git"
	action :sync
end

#$ bundle install --without=production:postgresql:mysql
bash "bundle install" do
	code "cd /home/yudozen/tmp/lokka && bundle install --without=production:postgresql:mysql --path vendor/bundle"
end

#$ bundle exec rake db:setup
bash "rake db:setup" do
	code "cd /home/yudozen/tmp/lokka && bundle exec rake db:setup"
end

# Apache 2
# Curl development headers with SSL support
# Apache 2 development headers
# Apache Portable Runtime (APR) development headers
# Apache Portable Runtime Utility (APU) development headers
%w{httpd curl-devel httpd-devel apr-devel apr-util-devel}.each do |pkg|
	package pkg do
		action :install
	end
end

# Passenger
gem_package "passenger" do
	action :install
	options "--no-rdoc --no-ri"
end

# sudo passenger-install-apache2-module
#$ bundle exec rackup
