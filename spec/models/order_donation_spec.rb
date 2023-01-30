require 'rails_helper'

RSpec.describe OrderDonation, type: :model do
  describe '購入情報の保存' do
    before do
      @order_donation = FactoryBot.build(:order_donation)
    end
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_donation).to be_valid
    end
    it 'postal_codeが空だと保存できないこと' do
      @order_donation.postal_code = nil
      @order_donation.valid?
      expect(@order_donation.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @order_donation.postal_code = '1234567'
      @order_donation.valid?
      expect(@order_donation.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end
    it 'prefecture_idの情報が空では保存できない' do
      @order_donation.prefecture_id = nil
      @order_donation.valid?
      expect(@order_donation.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'prefecture_idで「---」が選択されていると保存できないこと' do
      @order_donation.prefecture_id = 1
      @order_donation.valid?
      expect(@order_donation.errors.full_messages).to include('Prefecture must be other than 1')
    end
    it 'cityは空だと保存できないこと' do
      @order_donation.city = nil
      @order_donation.valid?
      expect(@order_donation.errors.full_messages).to include("City can't be blank")
    end
    it 'cityは全角でないと保存できないこと' do
      @order_donation.city = 'ja'
      @order_donation.valid?
      expect(@order_donation.errors.full_messages).to include('City is invalid. Input full-width characters.')
    end
    it 'house_numberは空だと保存できないこと' do
      @order_donation.house_number = nil
      @order_donation.valid?
      expect(@order_donation.errors.full_messages).to include("House number can't be blank")
    end
    it 'building_nameは空でも保存できること' do
      @order_donation.building_name = nil
      expect(@order_donation).to be_valid
    end
    it 'phone_numberが空だと保存できないこと' do
      @order_donation.phone_number = nil
      @order_donation.valid?
      expect(@order_donation.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが半角数字でないと保存できないこと' do
      @order_donation.phone_number = '０９０５６７４３２１８'
      @order_donation.valid?
      expect(@order_donation.errors.full_messages).to include('Phone number is not a number')
    end
    it "tokenが空では登録できないこと" do
      @order_donation.token = nil
      @order_donation.valid?
      expect(@order_donation.errors.full_messages).to include("Token can't be blank")
    end
  end
end
