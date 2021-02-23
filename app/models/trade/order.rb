module Trade
  class Order < ApplicationRecord
    include Model::Order
    include Model::Amount
    include Ordering::Payment
    include Ordering::Refund
    include PaymentType::Paypal
    include PaymentType::Alipay
    include PaymentType::Wxpay

    def payment_memo_id
      nil
    end

  end
end
