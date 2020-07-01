require 'database_connection'

describe DatabaseConnection do 

  context '.setup' do
    it "sets up a connection ro a database through PG" do
      expect(PG).to receive(:connect).with(dbname: 'bookmark_reloaded_test')
      DatabaseConnection.setup('bookmark_reloaded_test')
    end

    it "this connection is persistent" do
      connection = DatabaseConnection.setup('bookmark_reloaded_test')
      expect(DatabaseConnection.connection).to eq connection
    end  
  end

  context '.query' do
    it "passes a psql query to the database" do
      connection = DatabaseConnection.setup('bookmark_reloaded_test')
      expect(connection).to receive(:exec).with("SELECT * FROM bookmarks;")
      DatabaseConnection.query("SELECT * FROM bookmarks;")
    end
  end
end  

