FactoryBot.define do
  factory :user do
    username              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"g9" + Faker::Internet.password(min_length: 6)}
    password_confirmation {password} 
    last_name             {'山田'}
    last_name_kana        {'ヤマダ'}
    first_name            {'太郎'}
    first_name_kana       {'タロウ'}
    birth_day             {'1975-01-30'}
  end
end
