class SmartMigration76 < ActiveRecord::Migration[8.0]

  def change

    create_table :com_ssh_keys do |t|
      t.string :host
      t.string :private_key
      t.string :public_key
      t.string :fingerprint
      t.timestamps
    end

  end

end
