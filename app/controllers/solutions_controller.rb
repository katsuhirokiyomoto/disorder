class SolutionsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_follower_solution, only: [:create]
  
  def show
    @solution=Solution.find_by(id: params[:id])
  end

  def new
    @problemmicropost=Problemmicropost.find_by(id: params[:problemmicropost_id])
     @solution=current_user.solutions.build
  end

  def create
    @solution=current_user.solutions.build(solution_params)
    if @solution.save
      flash[:success]='解決案を投稿しました。'
      redirect_to solution_path(@solution)
    else
      flash[:danger]='解決案を投稿できませんでした。'
      render 'new'
    end
  end
  
  private
  
  def solution_params
    params.require(:solution).permit(:problemmicropost_id, :title, :content)
  end
  
  def correct_follower_solution
    @problemmicropost=current_user.problemmicroposts.find_by(id: params[:prorblemmicropost_id])
    if @problemmicropost
      redirect_to root_path
    end
  end

end
