class ItemrelationshipsController < ApplicationController
  def create
    @item=Item.find_or_initialize_by(code: params[:item_code])
    
    unless @item.persisted?
    results=RakutenWebService::Ichiba::Item.search(itemCode: @item.code)
    
    @item=Item.new(read(results.first))
    @item.save
    end
    
    current_user.recommend(@item)
    flash[:success]='商品をrecommendしました。'
    redirect_back(fallback_location: :root_path)
  end

  def destroy
    @item=Item.find_by(id: params[:id])
    current_user.unrecommend(@item)
    flash[:success]='商品をunrecommendしました。'
    redirect_back(fallback_location: root_path)
  end
  
end
