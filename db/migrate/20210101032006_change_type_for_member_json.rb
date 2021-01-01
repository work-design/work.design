class ChangeTypeForMemberJson < ActiveRecord::Migration[6.1]
  def change
    change_column :members, :department_ancestors, :jsonb
    change_column :organs, :area_ancestors, :jsonb
    change_column :organs, :parent_ancestors, :jsonb
  end
end
