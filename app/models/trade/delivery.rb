module Trade
  class Delivery < ApplicationRecord
    include Model::Delivery
    include Crm::Ext::Maintainable
  end
end
