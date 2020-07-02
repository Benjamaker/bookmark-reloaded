require 'bookmark'
require 'comment'

describe Comment do

  describe '.add' do
    it "creates a new comment" do
      bookmark = Bookmark.add(url: "https://testcomments.com", title: "Test_Comments")
      comment = Comment.add(text: "This is a test comment", bookmark_id: bookmark.id)

      expect(comment).to be_a Comment
      expect(comment.text).to eq "This is a test comment"
      expect(comment.bookmark_id).to eq bookmark.id
    end
  end 

  describe '.where' do
    it "gets the relevant comments from the database" do 
      bookmark = Bookmark.add(url: "https://testcomments.com", title: "Test_Comments")
      Comment.add(bookmark_id: bookmark.id, text: "This is a test comment")
      Comment.add(bookmark_id: bookmark.id, text: "This is a second test comment")
      comments = Comment.where(bookmark_id: bookmark.id)
      comment_1 = comments.first
      comment_2 = comments.last
      expect(comments.length).to eq 2
      expect(comment_1.text).to eq "This is a test comment"
      expect(comment_2.text).to eq "This is a second test comment"
      expect(comment_1.bookmark_id).to eq bookmark.id
      expect(comment_2.bookmark_id).to eq bookmark.id
    end
  end    
  
end  