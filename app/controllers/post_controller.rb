class PostController < ApplicationController
  def new
    @post=Post.new
  end

  def index
    @post=Post.all
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
