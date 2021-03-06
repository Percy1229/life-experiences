class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :edit, :likes]
  def index
  end

  def show
    @user = User.find(params[:id])
    @experiences = @user.experiences.order("year DESC").page(params[:page])
    counts(@user)
    if @count_liked >= 20
      @crown = "fas fa-crown"
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザーを登録しました。'
      redirect_to root_url
    else
      flash.now[:danger] = 'ユーザーの登録に失敗しました。'
      render :new
    end 
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'ユーザー情報を更新しました。'
      render :edit
    else
      flash.now[:danger] = 'ユーザー情報を更新されませんでした。'
      render :edit
    end
  end
  
  
  
  def likes 
    @user = User.find(params[:id])
    @users = User.all
    @likes = @user.likes.page(params[:page])
    counts(@user)
    if @count_liked >= 20
      @crown = "fas fa-crown"
    end
  end
  
  def liked 
    @user = User.find(params[:id])
    counts(@user)
  end
  
  private
  def user_params 
    params.require(:user).permit(
      :name, :email, :password, :password_confirmation, :introduce, :img,
       experiences_attributes:[:year_id, :content_id])
  end
end
