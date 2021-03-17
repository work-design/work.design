class RemoveFinancialMonthFromSetting < ActiveRecord::Migration[6.1]
  def change
    remove_column :attendance_settings, :financial_month_id

    add_column :attendance_settings, :effect_on, :date
    add_column :attendance_settings, :expire_on, :date
  end
end
