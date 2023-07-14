class ChangeFactoryProductionToJsonb < ActiveRecord::Migration[7.0]
  def change
    change_column :factory_productions, :extra, :jsonb
  end
end
