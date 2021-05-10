class AddFromToEmailLogs < ActiveRecord::Migration[6.1]
  def change
    add_column :email_logs, :mail_from, :string
  end
end
