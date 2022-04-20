Rails.configuration.assets.paths += [
  Rails.root.join('node_modules/@fortawesome/fontawesome-pro/webfonts').to_s
]

#Rails.configuration.assets.excluded_paths << GoodJob::Engine.root.join('app/assets/vendor').to_s
Rails.configuration.assets.excluded_paths << ActionText::Engine.root.join('app/assets/javascripts').to_s
Rails.configuration.assets.excluded_paths << ActionView::Railtie.root.join('lib/assets/compiled')
