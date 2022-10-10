class ChangeDispableTableType < ActiveRecord::Migration[7.0]
  def change
    drop_table :auth_disposable_tokens
    create_table :auth_disposable_tokens, id: :uuid do |t|
      t.string :identity, index: true
      t.datetime :used_at
      t.timestamps
    end
  end
end
