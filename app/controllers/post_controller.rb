class PostController < ApplicationController
  before_action :authenticate_user

  def new
    @post=Post.new
  end

  def index
    @posts=Post.all.order(created_at: :desc)
  end

  def create
    @post=Post.new(content: get_post_params[:content],
                    image_path: get_post_params[:image_path],
                    user_id: @current_user.id)  
    if @post.save
      redirect_to('/post')
    end
  end

  def get_post_params
    params.require(:post).permit(:content,:image_path)
  end

  def destroy
    @post=Post.find(params[:id])
    @post.destroy
    redirect_to('/post')
  end
end
