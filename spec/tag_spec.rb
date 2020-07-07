require 'tag'
require 'bookmark'

describe Tag do
  
  describe '.add' do
    it "creates a new tag" do
      tag = Tag.add(content: "test tag")
      p tag
      expect(tag).to be_a Tag 
      expect(tag.content).to eq "test tag"
    end 
  end 

  describe '.where' do
    it "returns tags linked to the given bookmark" do
      bookmark = Bookmark.add(url: "https://www.testtags.com", title: "Tags_test")
      tag1 = Tag.add(content: "Test tag 1")
      tag2 = Tag.add(content: "Test tag 2")
      BookmarkTag.add(bookmark_id: bookmark.id, tag_id: tag1.id)
      BookmarkTag.add(bookmark_id: bookmark.id, tag_id: tag2.id)
      tags = Tag.where(bookmark_id: bookmark.id)
      tag_a = tags.first
      tag_b = tags.last
      expect(tags.length).to eq 2
      expect(tag_a).to be_a Tag 
      expect(tag_b).to be_a Tag
      expect(tag_a.id).to eq tag1.id
      expect(tag_b.id).to eq tag2.id
      expect(tag_a.content).to eq tag1.content
      expect(tag_b.content).to eq tag2.content
    end 
  end    

end  