module Auth
  class User < ApplicationRecord
    include Model::User
    include Roled::Model::User
    include Notice::Model::User
    include Notice::Ext::Setting
    include Trade::Model::User
    include Org::Model::User
    include Wechat::Ext::User
    include Profiled::Ext::User
    include Bench::Model::User
    include Agential::Model::User
    include Ship::Ext::User

    has_one :wechat_user

  end
end
