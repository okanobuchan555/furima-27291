FactoryBot.define do
  factory :item do
    item_name { "あああ" }
    image {Faker::Lorem.sentence}
    content {Faker::Lorem.sentence}
    category_id {2}
    sales_status_id {2}
    shipping_fee_status_id {2}
    prefecture_id {2}
    scheduled_delivery_id {2}
    price {5000}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
