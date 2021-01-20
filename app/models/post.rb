class Post < ApplicationRecord
  include Wechat::Model::Post
  include RailsDetail::Post
  include RailsQuip::Post

  has_many_attached :pictures

end
