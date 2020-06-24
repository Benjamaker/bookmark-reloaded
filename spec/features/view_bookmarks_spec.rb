feature 'Viewing Bookmarks' do
  
  scenario 'A user can see all bookmarks' do
    connection = PG.connect(dbname: 'bookmark_reloaded_test')
    connection.exec("INSERT INTO bookmarks (url) VALUES ('https://github.com/Benjamaker');")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.google.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.linkedin.com');")
    visit('/bookmarks')
    expect(page).to have_content "https://github.com/Benjamaker"
    expect(page).to have_content "https://www.google.com"
    expect(page).to have_content "https://www.linkedin.com"
  end
  
end  