require 'pg'

class Bookmark
  
  def self.all
    if ENV['RACK_ENV'] == 'test'
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

  def self.add(url:)
    if ENV['RACK_ENV'] == 'test'
      p "connecting to test database"
      connection = PG.connect( dbname: 'bookmark_reloaded_test')
    else 
      p "connecting to development database"
      connection = PG.connect( dbname: 'bookmark_reloaded')  
    end
    result = connection.exec("INSERT INTO bookmarks (url) VALUES ('#{url}')")
  end
end  
