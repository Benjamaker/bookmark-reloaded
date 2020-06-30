feature 'Viewing Bookmarks' do
  
  scenario 'A user can see all bookmarks' do
    Bookmark.add(url: 'https://github.com/Benjamaker')
    Bookmark.add(url: 'https://www.google.com')
    Bookmark.add(url: 'https://www.linkedin.com')
    visit('/bookmarks')
    expect(page).to have_content "https://github.com/Benjamaker"
    expect(page).to have_content "https://www.google.com"
    expect(page).to have_content "https://www.linkedin.com"
  end
  
end  