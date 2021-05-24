class RailsComMigration29 < ActiveRecord::Migration[6.1]

  def change


    add_column :profiled_areas, :full, :string
    add_column :profiled_areas, :code, :string

    add_column :profiled_addresses, :area_ancestors, :json



    add_reference :wechat_scene_menus, :tag


    add_reference :finance_budgets, :fund
    add_reference :finance_budgets, :stock

    add_reference :finance_expense_members, :cash
    add_reference :finance_expense_members, :operator
    add_reference :finance_expense_members, :payable, polymorphic: true


    add_reference :finance_expenses, :stock



    add_reference :email_templates, :organ

    add_reference :bench_task_templates, :project_taxon
    add_column :bench_task_templates, :repeat_type, :string, default: "once"
    add_column :bench_task_templates, :repeat_days, :integer, array: true

    add_reference :bench_indicators, :project_taxon

    add_column :ship_favorites, :remark, :string

    add_column :ship_lines, :name, :string


    add_column :com_acme_orders, :issued_at, :datetime

    add_column :com_acme_identifiers, :file_valid, :boolean
  end

end
