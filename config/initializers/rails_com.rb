RailsCom.configure do |config|
  if Rails.env.development?
    config.acme_url = 'https://acme-staging-v02.api.letsencrypt.org/directory'
  end
end
