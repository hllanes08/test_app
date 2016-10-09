require 'resque/tasks'
requier 'resque/scheduler/tasks'

namespace :resque do
	task :setup do
		require 'resque'
		require 'resque-scheduler'
	end
end
