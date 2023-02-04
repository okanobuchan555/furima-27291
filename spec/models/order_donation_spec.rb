require 'rails_helper'

RSpec.describe OrderDonation, type: :model do
  describe '購入情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order_donation = FactoryBot.build(:order_donation,user_id: @user.id, item_id: @item.id)
      sleep 0.1
    end

    context '購入に成功する場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_donation).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_donation.building_name = nil
        expect(@order_donation).to be_valid
      end
    end

    context '購入に失敗する場合' do  
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
      it 'house_numberは空だと保存できないこと' do
        @order_donation.house_number = nil
        @order_donation.valid?
        expect(@order_donation.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @order_donation.phone_number = nil
        @order_donation.valid?
        expect(@order_donation.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが半角数字でないと保存できないこと' do
        @order_donation.phone_number = '０９０５６７４３２１８'
        @order_donation.valid?
        expect(@order_donation.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが9桁以下では購入できないこと' do
        @order_donation.phone_number = '090123456'
        @order_donation.valid?
        expect(@order_donation.errors.full_messages).to include("Phone number is invalid")
      end   
      it 'phone_numberが12桁以上では購入できないこと' do
        @order_donation.phone_number = '090123456789'
        @order_donation.valid?
        expect(@order_donation.errors.full_messages).to include("Phone number is invalid")
      end    
      it "tokenが空では登録できないこと" do
        @order_donation.token = nil
        @order_donation.valid?
        expect(@order_donation.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いていなければ購入できないこと' do
        @order_donation.user_id = ''
        @order_donation.valid?
        expect(@order_donation.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていなければ購入できないこと' do
        @order_donation.item_id = ''
        @order_donation.valid?
        expect(@order_donation.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
