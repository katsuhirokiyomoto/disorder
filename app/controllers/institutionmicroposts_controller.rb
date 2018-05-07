class InstitutionmicropostsController < ApplicationController
   before_action :require_user_logged_in
   before_action :correct_user_institutionmicropost, only: [:destroy]
   before_action :set_institutionmicropost, only: [:show, :edit, :update, :destroy]
  
  def show
  end

  def new
    @institution=Institution.find_by(id: params[:institution_id])
    @institutionmicropost=current_user.institutionmicroposts.build
  end

  def create
    @institutionmicropost=current_user.institutionmicroposts.build(institutionmicropost_params)
    
    if @institutionmicropost.save
      flash[:success]='お勧めの施設を投稿しました。'
      redirect_to institutions_url
    else
      @institution=Institution.find_by(id: params[:institution_id])
      flash.now[:danger]='お勧めの施設を投稿できませんでした。。'
      render 'new'
    end
    
  end

  def edit
  end

  def update
    if @institutionmicropost.update(institutionmicropost_params)
      flash[:success]='投稿した内容が正常に更新されました。'
      redirect_to institutionmicropost_url(@institutionmicropost)
    else
      flash.now[:danger]='投稿した内容が更新されませんでした。'
      render 'edit'
    end
  end

  def destroy
    @institutionmicropost.destroy
    flash[:success]='投稿した内容が正常に消去されました'
    redirect_to institution_url
  end
  
  private
  
  def institutionmicropost_params
    params.require(:institutionmicropost).permit(:content, :institution_id)
  end
  
  def set_institutionmicropost
    @institutionmicropost=Institutionmicropost.find_by(id: params[:id])
  end
  
  def correct_user_institutionmicropost
    @institutionmicropost=current_user.institutionmicroposts.find_by(id: params[:id])
    unless @institutionmicropost
      redirect_to root_path
    end
  end
  
end
