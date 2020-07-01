require_relative 'database_connection'

if ENV['RACK_ENV'] == 'test'
  p "connecting to test database"
  DatabaseConnection.setup('bookmark_reloaded_test')
else 
  p "connecting to development database"
  DatbaseConnection.setup('bookmark_reloaded')  
end