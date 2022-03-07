module Org
  class Member < ApplicationRecord
    include Model::Member
    include Bench::Ext::Member
    include Roled::Ext::Member
    include Trade::Ext::Member
    include Finance::Ext::Member
    include Notice::Model::Member
    include Notice::Ext::Setting
    include Attend::Ext::Member

  end
end
