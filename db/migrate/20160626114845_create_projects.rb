class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :catch_copy
      t.text :concept
      t.timestamps
      t.references :user_id
      t.references :likes_id

      t.timestamps
    end
  end
end
