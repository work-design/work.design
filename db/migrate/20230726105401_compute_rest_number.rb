class ComputeRestNumber < ActiveRecord::Migration[7.0]
  def change
    remove_column :trade_items, :rest_number
    add_column :trade_items, :rest_number, :virtual, type: :decimal, as: 'number - done_number', stored: true

  end
end
