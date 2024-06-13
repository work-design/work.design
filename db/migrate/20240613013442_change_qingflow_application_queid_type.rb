class ChangeQingflowApplicationQueidType < ActiveRecord::Migration[7.2]
  def change
    change_column :qingflow_forms, :queid, :integer, using: 'queid::integer'
  end
end
