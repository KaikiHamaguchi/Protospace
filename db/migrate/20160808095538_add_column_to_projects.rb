class AddColumnToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :likes_count, :integer, default: 0
  end
end
