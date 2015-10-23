class UsersController < ApplicationController
  
  def show # 追加
   @user = User.find(params[:id])
   @microposts = @user.microposts
  end
  
  def edit #課題
  @user = User.find(params[:id])
  end
  
  def update #課題
    @user = User.find(params[:id])
    if @user.update(user_params)
       redirect_to user_url(@user) ,notice: 'プロフィールを更新しました。'
    else
       flash.now[:alert] = "プロフィールに不備がある為、更新に失敗しました。"
       render 'edit'
    end
  end
	 
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user , notice: '会員登録完了です！'
    else
      render 'new'
    end
  end
  
  def following   #課題
    @user = User.find(params[:id])
    @users = @user.following_users
  end
 
  def followers   #課題
    @user = User.find(params[:id])
    @users = @user.follower_users
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :location, :password,
                                 :password_confirmation)
  end
end
