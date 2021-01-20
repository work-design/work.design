class User < ApplicationRecord
  include RailsBench::User
  include Roled::Model::User
  include Auth::Model::User
  include Trade::Model::User
  include Notice::Model::User
  include Notice::Ext::Setting
  include Wechat::Model::User
  include Org::Model::User
  include Profiled::Model::User
  include RailsAgency::User

  has_one :wechat_user


end

