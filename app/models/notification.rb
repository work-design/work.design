class Notification < ApplicationRecord
  include Notice::Model::Notification
  include Notice::Send::Socket
  include Notice::Send::Wechat
end
