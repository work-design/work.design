class SmartMigration66 < ActiveRecord::Migration[7.2]

  def change

    remove_column :com_states, :parent_id, :integer, limit: 8
    remove_column :com_states, :parent_ancestors, :jsonb


    add_column :qingflow_forms, :code, :string

    add_column :qingflow_applications, :code, :string
    add_column :qingflow_applications, :qsource, :string

    add_column :qingflow_apps, :host, :string

    add_column :qingflow_linkers, :operations_count, :integer

    add_column :factory_component_parts, :min, :integer
    add_column :factory_component_parts, :max, :integer

    add_column :factory_components, :multiple, :boolean


  end

end
