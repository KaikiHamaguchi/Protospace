class CreateThumbnails < ActiveRecord::Migration
  def change
    create_table :thumbnails do |t|
      t.text :image_url
      t.integer :status
      t.references :project

      t.timestamps
    end
  end
end
