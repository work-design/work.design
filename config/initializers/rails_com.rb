RailsCom.configure do |config|
  if Rails.env.development?
    config.acme_url = 'https://acme-staging-v02.api.letsencrypt.org/directory'
  end
  config.disable_debug = false
  config.notify_bot = 'WorkWechatBot'
  config.notify_key = "#{Rails.application.credentials[:log_bot_key]}"
  config.default_admin_accounts = Rails.application.credentials[:admin_accounts]
  config.debug = false
  config.debug_i18n = false
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
    'SolidQueue::BlockedExecution',
    'SolidQueue::RecurringExecution'
  ]
  config.override_prefixes = [
    'application'
  ]
end
