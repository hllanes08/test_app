require 'resque'
Resque.redis = "localhost:6379"
Resque.after_fork do |job|
	ActiveRecord::Base.connection.reconnect!
end
