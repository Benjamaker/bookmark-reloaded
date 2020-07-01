require 'bookmark'

describe Bookmark do

  context '.all' do
    it 'returns a list of bookmarks' do
      # connection = PG.connect(dbname: 'bookmark_reloaded_test')

      Bookmark.add(url: 'https://github.com/Benjamaker', title: 'Github')
      Bookmark.add(url: 'https://www.google.com', title: 'Google')
      Bookmark.add(url: 'https://www.linkedin.com', title: 'LinkedIn')
      bookmarks = Bookmark.all
      expect(bookmarks[0].url).to eq('https://github.com/Benjamaker')
      expect(bookmarks[1].url).to eq('https://www.google.com')
      expect(bookmarks[2].url).to eq('https://www.linkedin.com')
    end
  end

  context '.add' do
    it "adds a new bookmark" do
      bookmark = Bookmark.add(url: "https://www.testtube.com", title: "Test")
      expect(bookmark.url).to eq "https://www.testtube.com"
      expect(bookmark.title).to eq "Test"
    end 
  end    

  context '.delete' do
    it "deletes a bookmark" do
      bookmark = bookmark = Bookmark.add(url: "https://www.testdelete.com", title: "Test_Delete")
      Bookmark.delete(id: bookmark.id)
      bookmarks = Bookmark.all
      expect(bookmarks.length).to eq 0
    end
  end    
end       
