class RailsComMigration2 < ActiveRecord::Migration[6.0]

  def change





















































































































































































    remove_column :member_departments, :super_job_title_id, :integer, scale: 8
    remove_column :member_departments, :super_grade, :integer, scale: 4, default: "0"

    create_table :member_supers do |t|
      t.references :member
      t.references :super_job_title
      t.integer :grade, default: 0
      t.timestamps
    end



































  end

end