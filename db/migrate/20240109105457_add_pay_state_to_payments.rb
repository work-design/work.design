class AddPayStateToPayments < ActiveRecord::Migration[7.1]
  def change
    add_column :trade_payments, :pay_state, :string
  end
end
