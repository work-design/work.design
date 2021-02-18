class Member < ApplicationRecord
  include Org::Model::Member
  include Bench::Model::Member
  include Roled::Model::User
  include Trade::Model::Member
  include Finance::Ext::Member
  include Notice::Model::Member
  include Notice::Ext::Setting
  include Attend::Ext::Member

end
