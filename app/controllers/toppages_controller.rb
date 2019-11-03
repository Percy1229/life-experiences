class ToppagesController < ApplicationController
def index
  if logged_in?
    @users = User.all
    @experiences = Experience.all.order("year DESC").page(params[:page])
  end
end
end
