class ExtendMigration40 < ActiveRecord::Migration[7.0]

  def change


    add_belongs_to :trade_items, :scene
    add_belongs_to :trade_items, :desk
    add_column :trade_items, :job_id, :string
    add_column :trade_items, :produce_on, :date, comment: "对接生产管理"
  end

end
