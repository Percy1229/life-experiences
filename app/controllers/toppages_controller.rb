class ToppagesController < ApplicationController
    before_action :require_user_logged_in, only: [:index]
  def index
  if logged_in?
    @experiences = current_user.experiences.order(id: :desc).page(params[:page])
  end
  end

end
