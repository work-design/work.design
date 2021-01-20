class Order < ApplicationRecord
  include Trade::Model::Order
  include Trade::Model::Amount
  include Trade::PaymentType::Paypal
  include Trade::PaymentType::Alipay
  include Trade::PaymentType::Wxpay

  def payment_memo_id
    nil
  end

end





