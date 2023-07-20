module Profiled
  class Address < ApplicationRecord
    include Model::Address
    include Ship::Ext::Address
    include Crm::Ext::Maintainable
  end
end
