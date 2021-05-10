class AddPositionToTemplates < ActiveRecord::Migration[6.1]
  def change
    add_column :email_templates, :position, :integer
  end
end
