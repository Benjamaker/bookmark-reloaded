feature "Deleting bookmarks" do

  scenario "User can delete bookmarks" do
    Bookmark.add(url: "https://testdelete.com", title: "Test_delete")
    visit('/bookmarks')
    expect(page).to have_link("Test_delete", href: "https://testdelete.com")
    click_button('Delete')
    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link("Test_delete", href: "https://testdelete.com")
  end 
end  