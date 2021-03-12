class AddAssessAmountToStoack < ActiveRecord::Migration[6.1]
  def change
    add_column :stocks, :assess_amount, :decimal
  end
end
