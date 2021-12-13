class ExtendMigration4 < ActiveRecord::Migration[7.0]

  def change
    add_belongs_to :trade_trade_items, :organ
    add_column :factory_production_plans, :trade_items_count, :integer, default: 0

    add_column :org_organ_domains, :beian, :string, comment: "备案号"

    add_column :jia_bo_templates, :thumb_url, :string

    add_belongs_to :jia_bo_devices, :organ
    add_column :jia_bo_devices, :default, :boolean, default: false
  end

end
