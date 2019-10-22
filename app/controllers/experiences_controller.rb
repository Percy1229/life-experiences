class ExperiencesController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy, :update]
 
  def new
    if logged_in?
    @experience = current_user.experiences.build
    end
  end
 
  def create
    @experience = current_user.experiences.build(experience_params)
    if @experience.save
      flash[:success] = '経験をシェアしました。'
      redirect_to root_url
    else
      @experiences = current_user.experiences.order(id: :desc).page(params[:page])
      flash.now[:danger] = '経験をシェアできませんでした。'
      render 'toppages/index'
    end
  end

  def edit
    @experience = Experience.find(params[:id])
  end

  def update
    @experience = Experience.find(params[:id])
    if @experience.update(experience_params)
      flash[:success] = '更新しました。'
      redirect_to root_path
    else
      flash.now[:danger] = '更新されませんでした。'
      render :edit
    end
  end
  
  def destroy
    @experience.destroy
    flash[:success] = 'シェアを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private 
  def experience_params
    params.require(:experience).permit(:content, :year)
  end
  
  def correct_user
    @experience = current_user.experiences.find_by(id: params[:id])
    redirect_to signin_url unless @experience
  end
end
