RailsExtend.configure do |config|
  config.quiet_logs += [
    '/assets'
  ]
  config.ignore_models += [
    'SolidQueue::Semaphore',
    'SolidQueue::Process',
    'SolidQueue::Pause',
    'SolidQueue::Job',
    'SolidQueue::ScheduledExecution',
    'SolidQueue::ReadyExecution',
    'SolidQueue::BlockedExecution'
  ]
  config.override_prefixes = [
    'application'
  ]
end
