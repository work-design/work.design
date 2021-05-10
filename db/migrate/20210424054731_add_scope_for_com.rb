class AddScopeForCom < ActiveRecord::Migration[6.1]
  def change
    rename_table :infos, :com_infos
    rename_table :blob_defaults, :com_blob_defaults
    rename_table :acme_accounts, :com_acme_accounts
    rename_table :acme_orders, :com_acme_orders
    rename_table :acme_identifiers, :com_acme_identifiers
    rename_table :cache_lists, :com_cache_lists

    create_table :com_smtps do |t|
      t.string :name
      t.string :address
      t.string :port
      t.boolean :enable_starttls_auto
      t.boolean :ssl
      t.string :authentication
      t.string :openssl_verify_mode
      t.timestamps
    end

    create_table :com_smtp_accounts  do |t|
      t.references :smtp
      t.string :user_name
      t.string :password
      t.timestamps
    end
  end
end
