class RailsComMigration19 < ActiveRecord::Migration[6.1]

  def change







    remove_column :organs, :domain, :string



    add_column :promote_goods, :effect_at, :datetime
    add_column :promote_goods, :expire_at, :datetime





















    remove_column :expense_members, :cash_id, :integer, scale: 8
    remove_column :expense_members, :operator_id, :integer, scale: 8
    remove_column :expense_members, :payable_type, :string
    remove_column :expense_members, :payable_id, :integer, scale: 8
    remove_column :expense_members, :type, :string
    remove_column :expense_members, :payout_uuid, :string
    remove_column :expense_members, :requested_amount, :decimal, limit: 2, precision: 10
    remove_column :expense_members, :actual_amount, :decimal, limit: 2, precision: 10
    remove_column :expense_members, :paid_at, :datetime
    remove_column :expense_members, :account_bank, :string
    remove_column :expense_members, :account_name, :string
    remove_column :expense_members, :account_num, :string

    add_reference :funds, :buyer





















    add_column :wechat_apps, :apiclient_cert, :string
    add_column :wechat_apps, :apiclient_key, :string




































    add_column :payments, :refunded_amount, :decimal, default: 0
    remove_column :payments, :creator_id, :integer, scale: 8



    add_column :card_advances, :note, :string
    add_column :card_advances, :xx, :string

    add_reference :payment_references, :cart
    remove_column :payment_references, :buyer_type, :string
    remove_column :payment_references, :buyer_id, :integer, scale: 8


    add_reference :cards, :user
    add_reference :cards, :member
    add_column :cards, :currency, :string
    remove_column :cards, :client_type, :string
    remove_column :cards, :buyer_type, :string
    remove_column :cards, :buyer_id, :integer, scale: 8


    remove_column :promotes, :effect_at, :datetime
    remove_column :promotes, :expire_at, :datetime

    create_table :cash_givens do |t|
      t.references :cash
      t.references :organ
      t.string :title
      t.decimal :amount, default: 0
      t.string :note
      t.timestamps
    end








    add_column :card_templates, :valid_years, :integer, default: 0
    add_column :card_templates, :valid_months, :integer, default: 0
    add_column :card_templates, :currency, :string

    create_table :card_promotes do |t|
      t.references :card_template
      t.references :promote
      t.decimal :income_min, precision: 10, scale: 2, default: 0
      t.decimal :income_max, precision: 10, scale: 2, default: 99999999.99
      t.timestamps
    end

































































    create_table :organ_domains do |t|
      t.references :organ
      t.string :subdomain
      t.string :domain, default: "lvh.me"
      t.string :port, default: 3000
      t.string :host
      t.string :identifier, index: true
      t.string :appid
      t.boolean :default
      t.timestamps
    end














    add_column :acme_identifiers, :dns_valid, :boolean

















  end

end
