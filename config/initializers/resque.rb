require 'resque'
Resque.redis = "http://127.0.0.1:6379"
Resque.after_fork = Proc.new { ActiveRecord::Base.establish_connection }
