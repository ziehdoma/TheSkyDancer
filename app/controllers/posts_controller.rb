class PostsController < ApplicationController
  
  def blog
    set_params
  end 

  def index
  	@posts = Post.all.order('created_at DESC')

  end 

  def new
  	@post = Post.new
  end 


  def create
  	@post = Post.new(post_params)
  	if @post.save
  		redirect_to myblog_path(@post), alert: "Post Created!"
  	else 
  		render :new
  	end 
  end 

  def show
  	set_params
  end 

  def edit
  	set_params
  	
  end 
  def update
    set_params
    if @post.update (params[:post].permit(:title, :body, :author, :image))
      redirect_to myblog_path 
    else
      render 'edit'
    end 
  end 

  def destroy
  	set_params
  	@post.destroy
  	redirect_to posts_path, alert: "Post deleted"
  end 


  private 
  def post_params
  	params.require(:post).permit(:title, :body, :author, :image)
  end 

  def set_params
  	@post = Post.find(params[:id])
  end 

end
