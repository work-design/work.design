class CreateEmailTemplates < ActiveRecord::Migration[6.1]
  def change
    create_table :email_templates do |t|
      t.string :honorific
      t.string :body
      t.string :order_prefix
      t.timestamps
    end

    add_reference :email_logs, :template
  end
end
