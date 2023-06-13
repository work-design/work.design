module Auth
  class User < ApplicationRecord
    self.table_name = 'users'

    include Model::User
    include Roled::Ext::User
    include Notice::Model::User
    include Notice::Ext::Setting
    include Trade::Ext::User
    include Org::Ext::User
    include Wechat::Ext::User
    include Profiled::Ext::User
    include Bench::Ext::User
    include Ship::Ext::User

    has_one :wechat_user

  end
end
