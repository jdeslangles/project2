class Search
  def self.search(search)
    search_condition = "%" + search + "%"
    find(:all, :conditions => ['name LIKE ? OR description LIKE ?', search_condition, search_condition])
  end
end