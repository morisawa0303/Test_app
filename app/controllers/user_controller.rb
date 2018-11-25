class UserController < ApplicationController
  before_action :forbid_login_user,{only:[:new,:login_form]}

  def new
    @user=User.new
  end

  def create
    @user=User.new(params.require(:user).permit(:name,:mail,:password))
    if @user.save
      flash[:notice]="新規登録しました"
      redirect_to("/login")
    else
      redirect_to("/user/new")
    end
  end

  def login_form
    @user
  end

  def login
    @user=User.find_by(mail: params[:mail])
    if @user && @user.authenticate(params[:pass])
      session[:user_id]=@user.id
      flash[:notice]="ログインしました"
      redirect_to("/")
    else
      redirect_to('/login')
    end
  end

    def index
      if @current_user.administrator==true
        @users=User.all
      else
        redirect_to('/')
      end
     end

  def show
    @user = User.find_by(id: params[:id])
    if @current_user.administrator==true || @user==@current_user
      @posts = @user.posts.order(created_at: :desc)
    else
      redirect_to("/")
    end 
  end


  def logout
    session[:user_id]=nil
    flash[:notice]="ログアウトしました"
    redirect_to('/')
  end
end
