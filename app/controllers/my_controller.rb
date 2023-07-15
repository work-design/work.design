class MyController < ApplicationController
  include Org::Controller::Me
  include Com::Controller::Admin
  include Trade::Controller::My
  before_action :require_user

end
