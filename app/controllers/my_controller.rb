class MyController < ApplicationController
  include Trade::Controller::My
  before_action :require_user
  #before_action :require_session_organ

end
