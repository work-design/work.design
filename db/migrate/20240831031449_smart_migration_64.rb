class SmartMigration64 < ActiveRecord::Migration[7.2]

  def change

    create_table :com_state_hierarchies do |t|
      t.belongs_to :ancestor, type: :uuid
      t.belongs_to :descendant, type: :uuid
      t.integer :generations, null: false
      t.datetime :created_at, null: true
      t.datetime :updated_at, null: true
      t.index [:ancestor_id, :descendant_id, :generations], unique: true, name: "com/state_anc_desc_idx"
    end

    add_belongs_to :com_states, :parent
    add_column :com_states, :parent_ancestors, :jsonb


    create_table :qingflow_operations do |t|
      t.belongs_to :linker
      t.jsonb :params
      t.string :request_id
      t.string :result
      t.timestamps
    end

  end

end
