class ChangeAmouontTypeInStock < ActiveRecord::Migration[6.1]
  def change
    change_column :stocks, :amount, :integer
    change_column :stocks, :expense_amount, :integer
  end
end
