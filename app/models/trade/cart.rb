module Trade
  class Cart < ApplicationRecord
    include Model::Cart
    include Factory::Model::Cart
    include Crm::Ext::Maintainable
  end
end
