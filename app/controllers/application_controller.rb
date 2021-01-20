class ApplicationController < ActionController::Base
  include Auth::Controller::Application
  include Wechat::Controller::Application
  include RailsCom::Application
  include Roled::Controller::Application
  include Org::Controller::Application
  include Org::Controller::Me
  include Trade::Controller::Application
  include ActiveStorage::SetCurrent

  #before_action :support_organ
  protect_from_forgery with: :exception, unless: -> { json_format? }
  #content_security_policy true

end
