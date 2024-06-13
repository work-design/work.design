class SmartMigration17 < ActiveRecord::Migration[7.2]

  def change


    create_table :qingflow_logs do |t|
      t.belongs_to :item
      t.belongs_to :related, polymorphic: true
      t.string :exception
      t.string :exception_backtrace, array: true
      t.timestamps
    end

    add_column :qingflow_forms, :foreign_key, :string
  end

end
