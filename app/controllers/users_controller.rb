class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザーを登録しました。'
      redirect_to toppage_url
    else
      falsh.now[:danger] = 'ユーザーの登録に失敗しました。'
      render :new
    end 
  end
  
  private
  def user_params 
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :introduce, :image)
  end
end