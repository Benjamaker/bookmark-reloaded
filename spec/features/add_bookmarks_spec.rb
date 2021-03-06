feature "Adding bookmarks" do

  scenario "A user can add a bookmark" do 

    visit("/bookmarks/add")
    fill_in("title", with: "Test")
    fill_in("url", with: "https://www.testtube.com")
    
    click_button("Submit")

    expect(page).to have_link("Test", href: "https://www.testtube.com")
  end
end    

    
    