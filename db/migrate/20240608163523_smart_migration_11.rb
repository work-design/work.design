class SmartMigration11 < ActiveRecord::Migration[7.2]

  def change
    add_belongs_to :qingflow_forms, :meta_column


  end

end
