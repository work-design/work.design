RailsExtend.configure do |config|
  config.quiet_logs = [
    '/rails/active_storage',
    '/images',
    '/@fs',
    '/assets'
  ]
end
