class AddPopularityToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :popularity, :integer
  end
end
