class ToppagesController < ApplicationController
    before_action :require_user_logged_in, only: [:index]

  def index
    @users = User.order(id: :desc).page(params[:page]).per(25)
  end
end
