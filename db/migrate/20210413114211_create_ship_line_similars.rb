class CreateShipLineSimilars < ActiveRecord::Migration[6.1]
  def change
    create_table :ship_line_similars do |t|
      t.references :line
      t.references :similar
      t.integer :position
      t.decimal :score
      t.timestamps
    end
  end
end
