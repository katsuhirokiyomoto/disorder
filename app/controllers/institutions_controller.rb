class InstitutionsController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :new, :create]
  def index
    @institutions=Institution.all.page(params[:page])
  end

  def show
    @institution=Institution.find(params[:id])
  end

  def new
    @institution=Institution.new
  end

  def create
    @institution=Institution.new(institution_params)
    
    if @institution.save
      flash[:success]='施設作成に成功しました。'
      redirect_to institutions_url
    else
      flash.now[:danger]='施設作成に失敗しました。'
      render 'new'
    end
  end
  
  
  private
  
  def institution_params
    params.require(:institution).permit(:name, :url, :location, :kind)
  end
end
