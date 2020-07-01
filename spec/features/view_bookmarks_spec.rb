feature 'Viewing Bookmarks' do
  
  scenario 'A user can see all bookmarks' do
    Bookmark.add(url: 'https://github.com/Benjamaker', title: 'Github')
    Bookmark.add(url: 'https://www.google.com', title: 'Google')
    Bookmark.add(url: 'https://www.linkedin.com', title: 'LinkedIn')
    visit('/bookmarks')
    expect(page).to have_link('Github', href: "https://github.com/Benjamaker")
    expect(page).to have_link('Google', href: "https://www.google.com")
    expect(page).to have_link('LinkedIn', href: "https://www.linkedin.com")
  end
  
end  