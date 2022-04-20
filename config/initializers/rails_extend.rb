RailsExtend.configure do |config|
  config.quiet_logs = [
    '/rails/active_storage',
    '/images',
    '/@fs',
    '/assets'
  ]
  config.ignore_models = [
    'GoodJob::ActiveJobJob',
    'GoodJob::Execution',
    'GoodJob::Process',
    'GoodJob::Job'
  ]
  config.override_prefixes = [
    'application'
  ]
end
