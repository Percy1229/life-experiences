class ExperiencesController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
 
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
  end

  def update
  end
  
  def destroy
    @experience.destroy
    flash[:success] = 'シェアを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private 
  def experience_params
    params.require(:experience).permit(:content)
  end
  
  def correct_user
    @experience = current_user.experiences.find_by(id: params[:id])
    unless @experinece
    redirect_to root_url
    end
  end
end
