class SmartMigration68 < ActiveRecord::Migration[7.2]

  def change

    create_table :com_detector_bots do |t|
      t.belongs_to :detector
      t.string :type
      t.string :hook_url
      t.timestamps
    end

  end

end
