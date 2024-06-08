class SmartMigration9 < ActiveRecord::Migration[7.2]

  def change
    create_table :qingflow_form_hierarchies do |t|
      t.belongs_to :ancestor
      t.belongs_to :descendant
      t.integer :generations, null: false
      t.datetime :created_at, null: true
      t.datetime :updated_at, null: true
      t.index [:ancestor_id, :descendant_id, :generations], unique: true, name: "qingflow/form_anc_desc_idx"
    end

    create_table :qingflow_forms do |t|
      t.belongs_to :parent
      t.jsonb :parent_ancestors
      t.string :title
      t.string :queid
      t.string :que_type
      t.timestamps
    end
  end

end
