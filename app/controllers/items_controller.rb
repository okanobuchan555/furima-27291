class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]
  # before_action :set_item, only: [:edit, :update]

  def index
    @items = Item.all
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

  # def edit
  # end

  # def update
  #   @item.update(item_params)
  #   redirect_to root_path
  # end

  # def show
  # end

  private

  def item_params
    params.require(:item).permit(:item_name, :image, :content, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :price).merge(user_id:current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  # def set_item
  #   @item = Item.find(params[:id])
  # end

end
