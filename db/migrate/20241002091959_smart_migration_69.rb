class SmartMigration69 < ActiveRecord::Migration[8.0]

  def change

    add_belongs_to :qingflow_apps, :source

    create_table :bluetooth_devices do |t|
      t.belongs_to :organ
      t.string :name
      t.timestamps
    end
  end

end
