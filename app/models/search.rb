class Search
  def self.search(search)
    search_condition = "%" + search + "%"
    find(:all, :conditions => ['name LIKE ? OR description LIKE ? OR photo_album_name LIKE ?', search_condition])
  end
end