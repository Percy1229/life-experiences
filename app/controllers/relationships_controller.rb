class RelationshipsController < ApplicationController
before_action :require_user_logged_in
  def create
    experience = Experience.find(params[:favorite_id])
    current_user.favorite(experience)
    flash[:success] = 'いいねしました。'
    redirect_back(fallback_location: root_url)
  end

  def destroy
    experience = Experience.find(params[:favorite_id])
    current_user.unfavorite(experience)
    flash[:success] = 'いいねを解除しました。。'
    redirect_back(fallback_location: root_url)
  end
end
