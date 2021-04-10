class AddInviterToAccounts < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :inviter
    add_reference :accounts, :inviter
  end
end
