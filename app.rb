require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base

  enable :sessions, :method_override

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
    Bookmark.add(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end  

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end  

  get '/bookmarks/:id/edit' do
    @bookmark = Bookmark.find(id: params[:id])
    erb :'/bookmarks/edit'
  end  

  patch '/bookmarks/:id' do
    Bookmark.update(id: params['id'], url: params['url'], title: params['title'])
    redirect('/bookmarks')
  end

  

  
  run! if app_file == $0
end   

