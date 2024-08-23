class SmartMigration62 < ActiveRecord::Migration[7.2]

  def change

    create_table :com_err_notices do |t|
      t.belongs_to :err_bot
      t.string :controller_name, index: true
      t.timestamps
    end

    add_column :com_err_bots, :first_time, :boolean


    add_column :qingflow_files, :classifier, :string

    add_column :qingflow_applications, :sync_forms_at, :datetime
    add_column :qingflow_applications, :sync_items_at, :datetime
    remove_column :qingflow_applications, :last_sync_at, :datetime, precision: 6

    remove_column :factory_production_items, :production_plan_id, :integer, limit: 8

  end

end
