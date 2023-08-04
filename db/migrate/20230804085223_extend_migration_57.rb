class ExtendMigration57 < ActiveRecord::Migration[7.0]

  def change

    create_table :wechat_category_hierarchies do |t|
      t.belongs_to :ancestor
      t.belongs_to :descendant
      t.integer :generations, null: false
      t.datetime :created_at, null: true
      t.datetime :updated_at, null: true
      t.index [:ancestor_id, :descendant_id, :generations], unique: true, name: "wechat/category_anc_desc_idx"
    end

    create_table :wechat_categories do |t|
      t.belongs_to :parent
      t.string :name
      t.integer :level
      t.string :scope
      t.string :kind
      t.jsonb :extra
      t.jsonb :parent_ancestors
      t.timestamps
    end
  end

end
