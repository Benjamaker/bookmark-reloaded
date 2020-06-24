class Bookmark
  
  def self.all
    if ENV == 'test'
      p "connecting to test database"
      connection = PG.connect( dbname: 'bookmark_reloaded_test')
    else 
      p "connecting to development database"
      connection = PG.connect( dbname: 'bookmark_reloaded')  
    end
    result = connection.exec("SELECT * FROM bookmarks;")
    result.map do |bookmark|
      bookmark['url']
    end  
  end  

end  
