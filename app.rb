require 'sinatra/base'
require './lib/bookmark'
require './lib/database_connection_setup'
require 'uri'
require 'sinatra/flash'
require './lib/comment'
require './lib/tag'
require './lib/bookmark_tag'

class BookmarkManager < Sinatra::Base

  enable :sessions, :method_override
  register Sinatra::Flash

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
    flash[:notice] = "Error. Please submit a valid URL" unless Bookmark.add(url: params[:url], title: params[:title]) 
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
    Bookmark.update(id: params[:id], url: params[:url], title: params[:title])
    redirect('/bookmarks')
  end

  get '/bookmarks/:id/comments/add' do
    @bookmark_id = params[:id]
    erb :'/comments/add'
  end  

  post '/bookmarks/:id/comments' do
    Comment.add(bookmark_id: params[:id], text: params[:text])
    redirect '/bookmarks'
  end   
  
  get '/bookmarks/:id/tags/add' do 
    @bookmark_id = params[:id]
    erb :'/tags/add'
  end 
  
  post '/bookmarks/:id/tags' do 
    tag = Tag.add(content: params[:content])
    BookmarkTag.add(bookmark_id: params[:id], tag_id: tag.id)
    redirect '/bookmarks'
  end  

  run! if app_file == $0
end   

