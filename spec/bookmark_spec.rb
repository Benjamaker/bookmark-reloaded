require 'bookmark'

describe Bookmark do

  context '.all' do
    it 'returns a list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_reloaded_test')
      connection.exec("INSERT INTO bookmarks (url) VALUES ('https://github.com/Benjamaker');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.google.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.linkedin.com');")
      bookmarks = Bookmark.all
      expect(bookmarks[0]).to eq('https://github.com/Benjamaker')
      expect(bookmarks[1]).to eq('https://www.google.com')
      expect(bookmarks[2]).to eq('https://www.linkedin.com')
    end
  end
end       
