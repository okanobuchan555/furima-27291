FactoryBot.define do
  factory :order_donation do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '港区' }
    house_number { '青山1-1' }
    building_name { '青山ビル907' }
    phone_number { '09098762345' }
  end
end
