get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/category/:id' do
  @category = Category.find(params[:id])
  @posts = @category.posts 
  erb :posts
end 

get '/create_post' do
  erb :create_post 
end 

get '/posts/:id' do
  @post = Post.find(params[:id])
  erb :post 
end


get '/update_post/:id' do
  @post = Post.find(params[:id])
  erb :update_post
end




#========== POST ==========

post '/create_post' do
  @new_post = Post.create(params[:post])

  if @new_post.valid? 
    redirect to ('/')
  else 
    erb :create_post
  end 
end 

post '/update_post/:id' do
  @post = Post.find(params[:id])
  @post.update_attributes(params[:post])

  redirect "/posts/#{@post.id}"
end 

post '/delete_post/:id' do 
  @post = Post.find(params[:id])
  @post.destroy

  redirect '/'
end 
