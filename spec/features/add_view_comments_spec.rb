feature "Comments" do
  scenario "A user can add a comment to a bookmark" do
    bookmark = Bookmark.add(url: "https://testcomments.com", title: "Test_Comments")
    visit('/bookmarks')
    click_button('Comment')
    expect(current_path).to eq("/bookmarks/#{bookmark.id}/comments/add") 
    fill_in(:text, with: "Test comment for this bookmark")
    click_button('Submit')
    expect(current_path).to eq "/bookmarks"
    expect(page).to have_content "Test comment for this bookmark"
  end
end    

    