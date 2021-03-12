class AddTypeToBudgets < ActiveRecord::Migration[6.1]
  def change
    add_column :budgets, :type, :string
  end
end
