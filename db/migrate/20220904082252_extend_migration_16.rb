class ExtendMigration16 < ActiveRecord::Migration[7.0]

  def change

    create_table :ship_box_sells do |t|
      t.belongs_to :box_specification
      t.belongs_to :organ
      t.integer :sellable_count, default: 0
      t.string :name
      t.string :sku
      t.decimal :price, default: 0
      t.decimal :advance_price, default: 0
      t.jsonb :card_price, default: {}
      t.jsonb :wallet_price, default: {}
      t.jsonb :extra, default: {}
      t.string :unit
      t.decimal :quantity, default: 0
      t.decimal :unified_quantity, default: 0
      t.decimal :invest_ratio, default: 0, comment: "抽成比例"
      t.string :good_type
      t.timestamps
    end

    add_belongs_to :ship_box_holds, :member_organ
    add_column :ship_box_holds, :sellable, :integer
    add_column :ship_box_holds, :sell_price, :decimal
    add_column :ship_box_holds, :buy_price, :decimal
    remove_column :ship_box_holds, :saleable, :integer, scale: 4
    remove_column :ship_box_holds, :name, :string
    remove_column :ship_box_holds, :sku, :string
    remove_column :ship_box_holds, :price, :decimal, default: "0.0"
    remove_column :ship_box_holds, :advance_price, :decimal, default: "0.0"
    remove_column :ship_box_holds, :card_price, :jsonb, default: "{}"
    remove_column :ship_box_holds, :wallet_price, :jsonb, default: "{}"
    remove_column :ship_box_holds, :extra, :jsonb, default: "{}"
    remove_column :ship_box_holds, :unit, :string
    remove_column :ship_box_holds, :quantity, :decimal, default: "0.0"
    remove_column :ship_box_holds, :unified_quantity, :decimal, default: "0.0"
    remove_column :ship_box_holds, :invest_ratio, :decimal, default: "0.0", comment: "抽成比例"
    remove_column :ship_box_holds, :good_type, :string

    create_table :ship_box_buys do |t|
      t.belongs_to :box_specification
      t.belongs_to :organ
      t.integer :buyable_count, default: 0
      t.decimal :price
      t.timestamps
    end

    create_table :bench_taxon_indicators do |t|
      t.belongs_to :taxon
      t.belongs_to :facilitate_taxon
      t.belongs_to :indicator
      t.timestamps
    end

    create_table :bench_taxon_facilitates do |t|
      t.belongs_to :taxon
      t.belongs_to :facilitate_taxon
      t.belongs_to :facilitate
      t.timestamps
    end

    create_table :bench_taxons do |t|
      t.string :record_name
      t.string :name
      t.integer :projects_count, default: 0
      t.jsonb :parameters, default: {}
      t.decimal :fund_budget, default: 0
      t.decimal :fund_expense, default: 0
      t.decimal :budget_amount, default: 0
      t.decimal :expense_amount, default: 0
      t.timestamps
    end

    create_table :bench_standard_providers do |t|
      t.belongs_to :facilitate
      t.boolean :selected, default: false
      t.string :note
      t.decimal :export_price
      t.timestamps
    end

    create_table :bench_facilitators do |t|
      t.belongs_to :facilitate
      t.belongs_to :member
      t.string :name
      t.timestamps
    end

    create_table :bench_facilitatings do |t|
      t.belongs_to :facilitate
      t.belongs_to :facilitator
      t.belongs_to :member
      t.belongs_to :wallet_payment
      t.belongs_to :item
      t.datetime :start_at
      t.datetime :finish_at
      t.datetime :estimate_finish_at
      t.timestamps
    end

    add_belongs_to :bench_facilitate_taxons, :organ

    add_belongs_to :bench_facilitates, :organ
    add_belongs_to :bench_facilitates, :standard
  end

end
