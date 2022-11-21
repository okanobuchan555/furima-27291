class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  validates :item_name, :content, :image, :price, presence: true
  validates :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, presence: true
  validates :price, numericality: { with: /\A[0-9]+\z/, messege: "is not a number" } 
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, messege: "can't be blank" }                  
  # アソシエーション
  # belongs_to :user, dependent: :destroy
  # has_one :buyer, dependent: :destroy
end
