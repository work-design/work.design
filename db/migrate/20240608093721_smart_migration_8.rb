class SmartMigration8 < ActiveRecord::Migration[7.2]

  def change
    create_table :qingflow_applications do |t|
      t.belongs_to :app
      t.string :name
      t.string :key
      t.timestamps
    end

  end

end
