feature "Tags" do
  scenario "A user can add tags to bookmarks and view them" do
    bookmark = Bookmark.add(url: "https://www.testtags.com", title: "Tag_test")
    visit('/bookmarks')
    click_button('Add Tag')
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/tags/add"
    fill_in('content', with: 'test tag')
    click_button('Submit')
    expect(current_path).to eq '/bookmarks'
    expect(page).to have_content 'test tag'
  end
end  
  

    
