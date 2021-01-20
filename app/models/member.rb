class Member < ApplicationRecord
  include Org::Model::Member
  include RailsBench::Member
  include Roled::Model::User
  include Trade::Model::Member
  include RailsFinance::Member
  include RailsAttend::Member
  include Notice::Model::Member
  include Notice::Ext::Setting

end
