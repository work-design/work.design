module Auth
  class User < ApplicationRecord
    include Model::User
    include Roled::Model::User
    include Notice::Model::User
    include Notice::Ext::Setting
    include Trade::Model::User
    include Org::Model::User
  end
end
