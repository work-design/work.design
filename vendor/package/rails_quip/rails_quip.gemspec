$:.push File.expand_path('lib', __dir__)
require 'rails_quip/version'

Gem::Specification.new do |s|
  s.name = 'rails_quip'
  s.version = RailsQuip::VERSION
  s.authors = ['qinmingyuan']
  s.email = ['mingyuan0715@foxmail.com']
  s.homepage = 'https://github.com/work-design/rails_quip'
  s.summary = 'Summary of RailsQuip.'
  s.description = 'Description of RailsQuip.'
  s.license = 'LGPL-3.0'

  s.files = Dir[
    '{app,config,db,lib}/**/*',
    'LICENSE',
    'Rakefile',
    'README.md'
  ]

  s.add_dependency 'rails_com', '~> 1.2'
  s.add_dependency 'rails_detail'
  s.add_dependency 'httpx'
  s.add_development_dependency 'sqlite3'
end
