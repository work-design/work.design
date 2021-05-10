class AddPositionToAccounts < ActiveRecord::Migration[6.1]
  def change
    add_column :email_smtp_accounts, :position, :integer, index: true
  end
end
