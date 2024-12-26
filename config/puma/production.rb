dir = ENV['PWD']

plugin :tmp_restart

port 3000
workers 2
preload_app!
threads 2, 32
environment 'production'
directory dir

bind "unix://#{File.expand_path('tmp/sockets/puma.sock', dir)}"
pidfile "#{File.expand_path('tmp/pids/puma.pid', dir)}"
state_path "#{File.expand_path('tmp/sockets/puma.state', dir)}"
activate_control_app "unix://#{File.expand_path('tmp/sockets/pumactl.sock', dir)}"

on_worker_boot do
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
end

before_fork do
  ActiveRecord::Base.connection_pool.disconnect!
end

on_restart do
  puts "\n-----> On restart"
  puts "env: #{@options[:environment]}"
  puts "pidfile: #{@options[:pidfile]}"
  puts "binds: #{@options[:binds]}"
  puts "control_url: #{@options[:control_url]}"
end
