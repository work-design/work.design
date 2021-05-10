class AddSubjectToTemplates < ActiveRecord::Migration[6.1]
  def change
    add_column :email_templates, :contact, :string
    add_column :email_templates, :subject, :string
  end
end
