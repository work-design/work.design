class CreateEmailReasons < ActiveRecord::Migration[6.1]
  def change
    create_table :email_reasons do |t|
      t.string :body
      t.timestamps
    end
  end
end
