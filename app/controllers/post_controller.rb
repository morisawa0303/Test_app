class PostController < ApplicationController
  def new
    @post=Post.new
  end

  def index
    @posts=Post.all.order(created_at: :desc)
  end

  def create
    @post=Post.new(content: get_post_params[:content],
                    user_id: @current_user.id)  
    if @post.save
      redirect_to('/post')
    end
  end

  def get_post_params
    params.require(:post).permit(:content)
  end
end
