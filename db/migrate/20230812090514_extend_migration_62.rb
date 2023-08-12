class ExtendMigration62 < ActiveRecord::Migration[7.0]

  def change
    add_column :jia_bo_devices, :dev_id, :string
  end

end
