class ExtendMigration43 < ActiveRecord::Migration[7.0]

  def change

    add_column :crm_maintains, :type, :string
    add_column :crm_maintains, :remark, :string
    add_column :crm_maintains, :description, :string
    add_column :crm_maintains, :oper_userid, :string
    add_column :crm_maintains, :add_way, :string
    add_column :crm_maintains, :external_userid, :string
    add_column :crm_maintains, :pending_id, :string, index: true
    add_column :crm_maintains, :remark_mobiles, :jsonb
  end

end
