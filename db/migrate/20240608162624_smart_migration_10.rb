class SmartMigration10 < ActiveRecord::Migration[7.2]

  def change

    add_belongs_to :qingflow_forms, :application

  end

end
