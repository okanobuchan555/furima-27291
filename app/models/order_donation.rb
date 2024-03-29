class OrderDonation
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :phone_number, format: { with: /\A\d{10,11}\z/, only_integer: true, messege: "is invalid. is not a number" } 
    validates :house_number
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end