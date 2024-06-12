class ChangeQingFormsQueTypeInte < ActiveRecord::Migration[7.2]
  def change
    change_column :qingflow_forms, :que_type, :integer, using: 'que_type::integer'
  end
end
