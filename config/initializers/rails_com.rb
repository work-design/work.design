RailsCom.configure do |config|
  if Rails.env.development?
    config.acme_url = 'https://acme-staging-v02.api.letsencrypt.org/directory'
  end
  config.disable_debug = false
  config.notify_bot = 'WorkWechatBot'
  config.notify_key = "#{Rails.application.credentials[:log_bot_key]}"
end
