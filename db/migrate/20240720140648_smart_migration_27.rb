class SmartMigration27 < ActiveRecord::Migration[7.2]

  def change

    add_column :bench_taxon_indicators, :weight, :integer
    remove_column :bench_taxon_indicators, :facilitate_taxon_id, :integer, limit: 8

    remove_column :bench_taxon_facilitates, :facilitate_taxon_id, :integer, limit: 8

    create_table :bench_standards do |t|
      t.string :name
      t.timestamps
    end


    remove_column :bench_indicators, :taxon_id, :integer, limit: 8
    remove_column :bench_indicators, :facilitate_taxon_id, :integer, limit: 8

    remove_column :qingflow_items, :version_answers, :jsonb

    add_column :qingflow_forms, :group_title, :string

    create_table :qingflow_files do |t|
      t.string :url
      t.string :rule
      t.jsonb :result
      t.timestamps
    end
  end

end
