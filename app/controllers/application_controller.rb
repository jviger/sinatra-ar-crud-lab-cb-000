
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end
  
  get '/posts/new' do
  
    erb :new
  end
  
  post '/posts' do
  
    @blog_post = Post.create(params)
    redirect to '/posts'
  end
  
  get '/posts' do
    @posts = Post.all
    erb :index
  end 
  
  get '/posts/:id' do
    @blog_post = Post.find_by_id(params[:id])
    erb :show
  end
  
  get '/posts/:id/edit' do
    @blog_id = params[:id]
    @blog_post = Post.find_by_id(params[:id])
    erb:edit
  end
  
  puts '/posts/:id' do
    @blog_post = Post.find_by_id(params[:id])
    @blog_post.name = params[:name]
    @blog_post.content = params[:content]
    @blot_post.save
    erb :show
  end
  
  post '/posts/:id/delete' do
    @blog_post = Post.find_by_id(params[:id])
    @blog_post.delete
    erb :deleted
  end
  
end
