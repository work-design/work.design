class RemoveFactoryProductStateDefault < ActiveRecord::Migration[7.2]
  def change
    change_column_default :factory_productions, :state, nil
    change_column_default :factory_production_items, :state, nil
  end
end
