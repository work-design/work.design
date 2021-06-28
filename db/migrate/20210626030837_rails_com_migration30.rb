class RailsComMigration30 < ActiveRecord::Migration[6.1]

  def change
    add_column :profiled_profiles, :identity, :string

    add_reference :trade_card_advances, :card_prepayment

    create_table :trade_exchange_rates do |t|
      t.string :from
      t.string :to
      t.decimal :rate
      t.timestamps
    end

    create_table :trade_card_prepayments do |t|
      t.references :card_template
      t.string :token
      t.decimal :amount
      t.datetime :expire_at
      t.timestamps
    end

    add_column :trade_card_templates, :default, :boolean






    create_table :markdown_posts do |t|
      t.string :markdown
      t.string :html
      t.string :layout
      t.string :path
      t.timestamps
    end

    create_table :markdown_gits do |t|
      t.string :working_directory
      t.string :remote_url
      t.string :last_commit_massage
      t.datetime :last_commit_at
      t.timestamps
    end

  end

end
