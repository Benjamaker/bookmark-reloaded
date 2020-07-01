feature "Validating bookmarks" do
  scenario "If an invalid url is entered, the user gets an error" do
    visit('bookmarks/add')
    fill_in(:url, with: "not a url")
    click_button("Submit")
    expect(page).not_to have_content "not a url"
    expect(page).to have_content "Error. Please submit a valid URL" 
  end 
end 

