class SessionsController < ApplicationController
  def new
  end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    if signin(email, password)
      flash[:success] = 'サインインに成功しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'サインインに失敗しました。'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'サインアウトしました。'
    redirect_to root_url
  end
  
  private 
  def signin(email, password)
    @user = User.find_by(email: email)
    if @user && @user.authenticate(password)
      session[:user_id] = @user.id
      return true
    else
      return false
    end
  end
end
