RailsExtend.configure do |config|
  config.quiet_logs += [
    '/assets'
  ]
  config.ignore_models += []
  config.override_prefixes = [
    'application'
  ]
end
