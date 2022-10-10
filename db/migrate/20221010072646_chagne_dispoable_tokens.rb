class ChagneDispoableTokens < ActiveRecord::Migration[7.0]
  def change
    drop_table :auth_disposable_tokens
    create_table :auth_disposable_tokens do |t|
      t.string :token, index: {:unique=>true}
      t.string :identity, index: true
      t.datetime :used_at
      t.timestamps
    end
  end
end
