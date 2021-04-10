class RemovePrimaryFromAccounts < ActiveRecord::Migration[6.1]
  def change
    remove_column :accounts, :primary
  end
end
