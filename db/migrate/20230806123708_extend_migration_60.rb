class ExtendMigration60 < ActiveRecord::Migration[7.0]

  def change

    add_column :bench_facilitators, :description, :string

  end

end
