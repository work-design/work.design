Rails.application.configure do

  config.cache_classes = true
  config.eager_load = true

  config.consider_all_requests_local = false
  config.force_ssl = true
  config.action_controller.perform_caching = true
  #config.action_controller.asset_host = 'static.work.design'

  config.cache_store = :redis_cache_store, { url: 'redis://localhost:6379/2' }

  config.public_file_server.enabled = true

  config.active_job.queue_adapter = :sidekiq
  config.active_job.logger = ActiveSupport::Logger.new('log/active_job.log')

  config.active_storage.service = :upyun
  config.active_storage.variant_processor = :vips

  config.action_mailer.smtp_settings = {
    address: 'smtp.exmail.qq.com',
    port: 465,
    authentication: :login,
    user_name: Rails.application.credentials.dig(:mailer, :user_name),
    password: Rails.application.credentials.dig(:mailer, :password),
    ssl: true,
    return_response: true
  }

  config.log_level = :debug
  config.log_tags = [ :request_id ]
  config.log_formatter = ::Logger::Formatter.new

  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify

  config.active_record.dump_schema_after_migration = false

  config.action_cable.disable_request_forgery_protection = true
  config.action_cable.allowed_request_origins = [
    '*'
  ]
end
Rails.application.routes.default_url_options = {
  host: 'work.design',
  protocol: 'https'
}

ENV['EDITOR'] = 'vi'
