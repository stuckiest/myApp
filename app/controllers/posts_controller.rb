class PostsController < ApplicationController
  def index
    @posts = Post.all #we do an instance varialbe so that we can use this in the view
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

def create
  @post = Post.new(post_params)

  if @post.save
    redirect_to posts_path
  else
    render :new
  end
end

def edit
  @post = Post.find(params[:id])
end

def update
  @post = Post.find(params[:id])

  if @post.update(post_params)
    redirect_to posts_path
  else
    render :edit
  end 
end

def destroy
 @post = Post.find(params[:id])
 @post.destroy #takes it completely out of the database
 redirect_to posts_path #taking them back to index so that they can see the rest of the posts
end      

private

def post_params
  params.require(:post).permit(:title, :author, :body)
end        

end
