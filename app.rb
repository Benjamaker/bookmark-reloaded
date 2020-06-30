require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base

  get '/' do
    "Hello World"
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'/bookmarks/index'
  end  

  get '/bookmarks/add' do
    erb :'bookmarks/add'
  end  

  post '/bookmarks' do
    Bookmark.add(url: params[:url])
    redirect '/bookmarks'
  end  

  
  run! if app_file == $0
end   

