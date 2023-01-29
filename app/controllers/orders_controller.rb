class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @order_donation = OrderDonation.new
  end

  def create
    @order_donation = OrderDonation.new(donation_params)
    if @order_donation.valid?
      
      @order_donation.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def donation_params
    params.require(:order_donation).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
