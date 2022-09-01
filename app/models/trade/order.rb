module Trade
  class Order < ApplicationRecord
    include Model::Order
    include Model::Amount
    include Ship::Ext::Order
    include Crm::Ext::Maintainable

    def payment_memo_id
      nil
    end

  end
end
