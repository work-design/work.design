module Auth
  class User < ApplicationRecord
    self.table_name = 'users'

    include Model::User
    include Roled::Ext::User
    include Notice::Model::User
    include Notice::Ext::Setting
    include Trade::Ext::User
    include Org::Model::User
    include Wechat::Ext::User
    include Profiled::Ext::User
    include Bench::Model::User
    include Ship::Ext::User

    has_one :wechat_user

  end
end
