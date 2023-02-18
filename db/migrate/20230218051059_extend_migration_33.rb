class ExtendMigration33 < ActiveRecord::Migration[7.0]

  def change

    create_table :auth_authorized_tokens, id: :uuid do |t|
      t.belongs_to :member
      t.string :identity, index: true
      t.datetime :expire_at
      t.string :session_key, comment: "目前在小程序下用到"
      t.integer :access_counter
      t.boolean :mock_member
      t.boolean :mock_user
      t.string :business
      t.string :uid
      t.string :session_id
      t.string :suite_id
      t.string :appid
      t.timestamps
    end
  end

end
