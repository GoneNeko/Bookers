class RenameTitle2ColumnToBooks < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :profile_image_id, :image_id
  end
end
