class AddPhotoPictureToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :photo_picture, :string
  end
end
