class ExtendMigration14 < ActiveRecord::Migration[7.0]

  def change

    remove_column :ship_packages, :last_box_id, :integer, scale: 8

    create_table :ship_box_logs do |t|
      t.belongs_to :box
      t.belongs_to :package
      t.datetime :boxed_in_at
      t.datetime :boxed_out_at
      t.integer :duration
      t.string :confirm_mode
      t.timestamps
    end

    add_column :ship_boxes, :box_logs_count, :integer, default: 0

    add_column :trade_rents, :duration, :integer, default: 0

    add_belongs_to :trade_item_promotes, :promote_charge
    add_column :trade_item_promotes, :value, :decimal
    remove_column :trade_item_promotes, :organ_id, :integer, scale: 8
    remove_column :trade_item_promotes, :cart_promote_id, :integer, scale: 8
    remove_column :trade_item_promotes, :sequence, :integer, scale: 4

    add_column :trade_cart_promotes, :value, :decimal

    add_column :trade_items, :rent_start_at, :datetime
    add_column :trade_items, :rent_estimate_finish_at, :datetime
  end

end
