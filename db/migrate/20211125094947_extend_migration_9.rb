class ExtendMigration9 < ActiveRecord::Migration[7.0]

  def change
    add_column :com_acme_accounts, :ali_key, :text
    add_column :com_acme_accounts, :ali_secret, :text
  end

end
