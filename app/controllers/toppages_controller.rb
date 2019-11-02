class ToppagesController < ApplicationController
    before_action :require_user_logged_in, only: [:index]
def index
  if logged_in?
    @users = User.all
    @experiences = Experience.all.order("year DESC").page(params[:page])
  end
end

def guide 
end 
end
