class ExtendMigration18 < ActiveRecord::Migration[7.0]

  def change
    add_column :wechat_suites, :kind, :string

    rename_table :wechat_tickets, :wechat_platform_tickets


    add_column :wechat_corps, :host, :string
    add_column :wechat_corps, :token, :string
    add_column :wechat_corps, :encoding_aes_key, :string

    add_belongs_to :trade_rents, :good, polymorphic: true

    add_column :trade_orders, :aim, :string

    add_column :trade_items, :rent_finish_at, :datetime

    remove_column :org_organ_domains, :appid, :string

    remove_column :org_organs, :corp_id, :string
  end

end
