class AddTrusteeAmountToAssessments < ActiveRecord::Migration[6.1]
  def change
    add_column :assessments, :trustee_amount, :decimal
  end
end
