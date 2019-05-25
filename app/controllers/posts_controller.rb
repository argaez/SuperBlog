class PostsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show] 
  before_action :set_post, only: [:show, :edit, :update, :destroy]
 #before_action :is_user?, except: [:index, :show] 

  def index

  	@posts = Post.all

  end

  def new
   
   @post = Post.new

  end

  def edit

   
  end

  def show

  
  end

   def update

    @post = Post.find(params[:id])
      if @post.update(post_params)
        redirect_to posts_path, notice: "Post has been successfully Updated"
      else
        render :edit
      end
  end

  def create

  	@post = Post.new(post_params)
  	@post.user = current_user

  		if @post.save 
  			flash[:notice] = "Post Creado"
  			redirect_to posts_path, notice: "Post is successfully published"
  		else
  			render :new
  		end
  end

  def destroy

    post = Post.find(params[:id])
    post.destroy

    redirect_to posts_path, notice: "El post fue eliminado con éxito"

  end

  private

   def set_post
      @post = Post.find(params[:id])
    end

   def post_params

      params.require(:post).permit(:title, :content, :user_id)
    
    end

end
