require 'pg'

def setup_test_database
  p "Setting up test database..."
  connection = PG.connect( dbname: 'bookmark_reloaded_test' )
  connection.exec("TRUNCATE bookmarks CASCADE")
end  