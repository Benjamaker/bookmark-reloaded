require 'sinatra/base'

class BookmarkManager < Sinatra::Base

  get '/' do
    "Hello World"
  end

  get '/bookmarks' do
    bookmarks = [
      "https://github.com/Benjamaker",
      "https://www.linkedin.com",
      "https://www.google.com",
      ]
    bookmarks.join
  end  
  
  run! if app_file == $0
end   
