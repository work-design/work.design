module Trade
  class Order < ApplicationRecord
    include Model::Order
    include Notice::Order
    include Print::Order
    include Ship::Ext::Order
    include Crm::Ext::Maintainable

    def payment_memo_id
      nil
    end

  end
end
