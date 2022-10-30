class PanelController < ApplicationController
  include Com::Controller::Panel
  before_action :require_user
  before_action :require_role
  #after_action :set_flash, only: [:update, :create, :destroy]

  def rails_role_user
    current_user
  end

end
