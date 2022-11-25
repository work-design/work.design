class ExtendMigration31 < ActiveRecord::Migration[7.0]

  def change

    create_table :space_stations do |t|
      t.belongs_to :organ
      t.belongs_to :area
      t.string :name
      t.string :code
      t.string :detail
      t.integer :buildings_count
      t.integer :rooms_count
      t.jsonb :area_ancestors
      t.timestamps
    end

    create_table :space_rooms do |t|
      t.belongs_to :station
      t.belongs_to :building
      t.string :name
      t.string :code
      t.integer :floor
      t.integer :grids_count
      t.timestamps
    end

    create_table :space_grids do |t|
      t.belongs_to :room
      t.string :name
      t.string :code
      t.integer :width
      t.integer :height
      t.integer :length
      t.integer :floor
      t.timestamps
    end

    create_table :space_buildings do |t|
      t.belongs_to :station
      t.string :name
      t.string :code
      t.timestamps
    end

    add_belongs_to :factory_production_items, :grid
    add_belongs_to :factory_production_items, :room
    add_belongs_to :factory_production_items, :building
    add_belongs_to :factory_production_items, :station

    add_belongs_to :factory_production_plans, :station

    add_belongs_to :auth_authorized_tokens, :corp_user
  end

end
