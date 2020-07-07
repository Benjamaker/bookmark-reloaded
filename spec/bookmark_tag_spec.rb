require 'bookmark_tag'

describe BookmarkTag do

  describe '.add' do
    it "creates a link between a bookmark and a tag" do 
      bookmark = Bookmark.add(url: "https://testlink.com", title: "Tag Link")
      tag = Tag.add(content: "Test Tag")

      bookmark_tag = BookmarkTag.add(bookmark_id: bookmark.id, tag_id: tag.id)

      expect(bookmark_tag).to be_a BookmarkTag
      expect(bookmark_tag.tag_id).to eq tag.id
      expect(bookmark_tag.bookmark_id).to eq bookmark.id 
    end 
  end
end      