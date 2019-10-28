class RelationshipsController < ApplicationController
before_action :require_user_logged_in
  def create
    user = User.find(params[:favorite_id])
    current_user.favorite(user)
    flash[:success] = 'いいねしました。'
    redirect_back(fallback_location: root_url)
  end

  def destroy
    user = User.find(params[:favorite_id])
    current_user.unfavorite(user)
    flash[:success] = 'いいねを解除しました。'
    redirect_back(fallback_location: root_url)
  end
end
