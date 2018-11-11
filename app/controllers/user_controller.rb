class UserController < ApplicationController
  def new
    @user=User.new
  end


  def create
    @user=User.new(params.require(:user).permit(:name,:mail,:pass))
    if @user.save
      flash[:notice]="新規登録しました"
      redirect_to("/")
    else
      redirect_to("/user/signup")
    end
  end

  def login_form
    @user
  end

  def login
    @user=User.find_by(mail: params[:mail])
    if @user
      session[:user_id]=@user.id
      redirect_to("/")
    else
      redirect_to('/login')
    end
  end
end
