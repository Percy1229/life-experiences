class ToppagesController < ApplicationController
    before_action :require_user_logged_in, only: [:index]
def index
  if logged_in?
    @users = User.all
  end
end
end
