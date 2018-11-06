class Admin::ItemsController < ApplicationController
  before_action :require_admin

  def edit
    @item = Item.find_by(slug: params[:slug])
  end

  def update
    @item = Item.find_by(slug: params[:slug])
    if @item.update(item_params)
      flash[:success] = "The item's slug was successfully updated."
      redirect_to item_path(@item)
    else
      render file: 'errors/not_found', status: 404
    end
  end


 private

  def item_params
    params.require(:item).permit(:slug)
  end

   def require_admin
     redirect_to root_path unless current_admin?
   end
end
