class ProblemmicropostsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user_problemmicropost, only: [:destroy]
  before_action :set_problemmicropost, only: [:show, :destroy] 
  
  def index
    @problemmicroposts=Problemmicropost.all.page(params[:page])
  end

  def show
  end

  def new
    @problemmicropost=current_user.problemmicroposts.build
  end

  def create
    @problemmicropost=current_user.problemmicroposts.build(problemmicropost_params)
    
    if @problemmicropost.save
      flash[:success]="お悩みを投稿しました。"
      redirect_to problemmicroposts_url
    else
      flash.now[:danger]="お悩みを投稿できませんでした"
      render 'new'
    end
    
  end

  def destroy
    @problemmicropost.destroy
    flash[:success]='投稿した内容が正常に削除されました。'
    redirect_to problemmicroposts_url
  end
  
  private
  
  def problemmicropost_params
    params.require(:problemmicropost).permit(:title, :content)
  end
  
  def correct_user_problemmicropost
    @problemmicropost=current_user.problemmicroposts.find_by(id: params[:id])
    unless @problemmicropost
      redirect_to root_path
    end
  end
  
  def set_problemmicropost
    @problemmicropost=Problemmicropost.find_by(id: params[:id])
  end
  
  
end
