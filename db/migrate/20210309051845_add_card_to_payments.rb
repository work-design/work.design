class AddCardToPayments < ActiveRecord::Migration[6.1]
  def change
    add_reference :payments, :card
  end
end
