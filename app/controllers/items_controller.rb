class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def items_params
    params.require(:item).permit(:image, :item_name, :explanation, :category_id, :status_id, :delivery_charge_id, :area_id, :delivery_date_id, :price).merge(user_id: current_user.id)
  end
end
