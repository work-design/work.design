class RailsComMigration20 < ActiveRecord::Migration[6.1]

  def change







    add_column :organs, :domain, :string





















































































    add_column :card_advances, :kind, :string
    remove_column :card_advances, :xx, :string




























































    rename_column :rule_operations, :action_identifier, :action_name


    add_column :role_rules, :controller_path, :string
    add_column :role_rules, :controller_name, :string
    remove_column :role_rules, :controller_identifier, :string

    add_column :rules, :controller_path, :string
    add_column :rules, :controller_name, :string
    add_column :rules, :path, :string
    add_column :rules, :verb, :string
    remove_column :rules, :identifier, :string
    remove_column :rules, :controller_identifier, :string


    add_column :governs, :controller_path, :string
    add_column :governs, :controller_name, :string
    remove_column :governs, :identifier, :string









    add_column :authorized_tokens, :identity, :string, index: true
    remove_column :authorized_tokens, :account_id, :integer, scale: 8
    remove_column :authorized_tokens, :member_id, :integer, scale: 8





































  end

end
