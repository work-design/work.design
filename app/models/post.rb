class Post < ApplicationRecord
  include Wechat::Model::Post
  include Detail::Model::Post
  #include RailsQuip::Post

  has_many_attached :pictures

end
