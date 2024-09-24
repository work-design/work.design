class SmartMigration67 < ActiveRecord::Migration[7.2]

  def change

    create_table :com_detector_errors do |t|
      t.belongs_to :detector
      t.string :status
      t.string :body
      t.string :error
      t.timestamps
    end

    create_table :com_detectors do |t|
      t.string :name
      t.string :url
      t.timestamps
    end

    add_column :wechat_apps, :webview_domain_registered, :string, array: true

    add_column :qingflow_linkers, :job_id, :string
  end

end
