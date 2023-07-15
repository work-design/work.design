class ExtendMigration41 < ActiveRecord::Migration[7.0]

  def change
    create_table :cms_videos do |t|
      t.belongs_to :author
      t.belongs_to :organ
      t.belongs_to :video_taxon
      t.string :title
      t.integer :share_count
      t.integer :view_count
      t.integer :liked_count
      t.integer :comments_count
      t.string :water_mark_job
      t.string :state
      t.timestamps
    end

    create_table :cms_progressions do |t|
      t.belongs_to :user
      t.belongs_to :progressive, polymorphic: true
      t.decimal :ratio, comment: "完成比例"
      t.decimal :time
      t.decimal :duration
      t.string :state
      t.timestamps
    end

    create_table :cms_carousels do |t|
      t.belongs_to :organ
      t.string :title
      t.integer :position
      t.string :link
      t.timestamps
    end

    create_table :cms_audios do |t|
      t.belongs_to :author
      t.belongs_to :organ
      t.string :title
      t.string :state
      t.timestamps
    end
  end

end
