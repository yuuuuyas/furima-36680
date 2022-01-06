class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @items = Item.order("created_at DESC")
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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    if @item.user_id == current_user.id
    else
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(items_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def items_params
    params.require(:item).permit(:image, :item_name, :explanation, :category_id, :status_id, :delivery_charge_id, :area_id, :delivery_date_id, :price).merge(user_id: current_user.id)
  end
end
