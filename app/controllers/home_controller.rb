class HomeController < ApplicationController

  def index
    @post = Detail::Post.find_by(code: 'home/index')
  end

  private
  def check_variant
    request.variant = :phone if request.user_agent =~ /iPad|iPhone|iPod|Android/
  end

end
