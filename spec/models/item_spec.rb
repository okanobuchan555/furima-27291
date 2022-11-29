require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/star.png')
  end
  describe "商品出品機能" do
    context '内容に問題ない場合' do
      it '全て正常' do
        expect(@item).to be_valid
      end
      it 'ログイン状態のユーザーのみ、商品出品ページへ遷移できること' do
        @item = FactoryBot.create(:user)
        expect(@item).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it "商品名が空だと登録できない" do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end

      it "商品の説明が空では出品できない" do
        @item.content = ''  # emailの値を空にする
        @item.valid?
        expect(@item.errors.full_messages).to include "Content can't be blank"
      end

      it '商品画像がないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end

      it 'カテゴリーの情報が空では出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end

      it '商品の状態についての情報が空では出品できない' do
        @item.sales_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Sales status can't be blank"
      end

      it '配送料の負担についての情報が空では出品できない' do
        @item.shipping_fee_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping fee status can't be blank"
      end

      it '発売元の地域についての情報が空では出品できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end

      it '発送までの日数についての情報が空では出品できない' do
        @item.scheduled_delivery_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Scheduled delivery can't be blank"
      end

      it '価格についての情報が空では出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it "販売価格は半角数字でないと出品できない" do
        @item.price = '１００００'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end

      it "販売価格は¥300より少ない時は出品できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end

      it "販売価格は¥9999999より多い時は出品できない" do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end

    end
  end

end
