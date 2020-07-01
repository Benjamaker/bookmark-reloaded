feature "Updating bookmarks" do
  scenario "User can update existing bookmarks" do 
    bookmark = Bookmark.add(url: "https://testupdate.com", title: "Test_up")
    visit("/bookmarks")
    expect(page).to have_link("Test_up", href: "https://testupdate.com")
    click_button('Edit')
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"
    fill_in(:url, with: "https://testupdatedone.com")
    fill_in(:title, with: "Test_Updated")
    click_button("Submit")
    expect(current_path).to eq "/bookmarks"
    expect(page).not_to have_link("Test_up", href: "https://testupdate.com")
    expect(page).to have_link("Test_Updated", href: "https://testupdatedone.com")
  end
end    