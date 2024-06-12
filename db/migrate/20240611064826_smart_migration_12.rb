class SmartMigration12 < ActiveRecord::Migration[7.2]

  def change


    create_table :qingflow_items do |t|
      t.belongs_to :application
      t.string :applyid, index: true
      t.jsonb :answers
      t.timestamps
    end


  end

end
