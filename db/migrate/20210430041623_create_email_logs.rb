class CreateEmailLogs < ActiveRecord::Migration[6.1]
  def change
    rename_table :log_mailers, :email_logs
    rename_table :log_records, :com_errs
    rename_table :log_csps, :com_csps

    rename_table :com_smtps, :email_smtps
    rename_table :com_smtp_accounts, :email_smtp_accounts

    create_table :email_subscriptions do |t|
      t.references :smtp
      t.references :smtp_account
      t.string :address
      t.string :state
      t.datetime :subscribe_at
      t.datetime :unsubscribe_at
      t.timestamps
    end
  end
end
