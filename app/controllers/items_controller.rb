class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    redirect_to root_path unless current_user.id == @item.user_id
    if @item.order.present?
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params) 
      redirect_to item_path
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @item.destroy if current_user.id == @item.user_id
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :image, :content, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :price).merge(user_id:current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
