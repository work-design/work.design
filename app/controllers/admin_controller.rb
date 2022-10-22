class AdminController < ApplicationController
  include Org::Controller::Me
  include Com::Controller::Admin
  before_action :require_login
  before_action :require_role
  #before_action :require_session_organ

end
