module Trade
  class Order < ApplicationRecord
    include Model::Order
    include Model::Amount

    def payment_memo_id
      nil
    end

  end
end
