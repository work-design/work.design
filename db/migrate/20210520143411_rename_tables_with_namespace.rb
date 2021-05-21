class RenameTablesWithNamespace < ActiveRecord::Migration[6.1]
  def change
    rename_table :absence_stats, :attend_absence_stats
    rename_table :absences, :attend_absences

    rename_table :abuses, :interact_abuses

    rename_table :accounts, :auth_accounts

    rename_table :acme_accounts, :com_acme_accounts
    rename_table :acme_identifiers, :com_acme_identifiers
    rename_table :acme_orders, :com_acme_orders

    rename_table :address_users, :profiled_address_users
    rename_table :addresses, :profiled_addresses

    rename_table :advances, :trade_advances

    rename_table :agencies, :agential_agencies
  end
end
