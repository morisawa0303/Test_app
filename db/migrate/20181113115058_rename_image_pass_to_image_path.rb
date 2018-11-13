class RenameImagePassToImagePath < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts,:image_pass,:image_path
  end
end
