require 'database_connection'

describe DatabaseConnection do 

  context '.setup' do
    it "sets up a connection ro a database through PG" do
      expect(PG).to receive(:connect).with(dbname: 'bookmark_reloaded_test')
      DatabaseConnection.setup('bookmark_reloaded_test')
    end
  end
  
end  

