class AddNameToBusiness < ActiveRecord::Migration[6.1]
  def change
    add_column :busynesses, :name, :string
  end
end
