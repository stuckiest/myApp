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

private

def post_params
  params.require(:post).permit(:title, :author, :body)
end        

end