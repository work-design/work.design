class DropFundBudgets < ActiveRecord::Migration[6.1]
  def change
    drop_table :fund_budgets
    drop_table :fund_uses
    drop_table :fund_expenses
  end
end
