class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    @order_donation = OrderDonation.new
    if current_user.id == @item.user_id || @item.order.present?
      redirect_to root_path
    end
  end

  def create
    @order_donation = OrderDonation.new(donation_params)
    if @order_donation.valid?
      pay_item
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

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: set_item[:price],  # 商品の値段
      card: donation_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
