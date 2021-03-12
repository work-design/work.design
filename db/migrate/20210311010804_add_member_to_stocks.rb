class AddMemberToStocks < ActiveRecord::Migration[6.1]
  def change
    add_reference :stocks, :member
  end
end
