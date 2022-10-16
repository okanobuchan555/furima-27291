require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe "ユーザー新規登録" do
    context '内容に問題ない場合' do
      it '全て正常' do
      expect(@user).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it "ニックネームが空だと登録できない" do
        @user.username = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Username can't be blank"
      end

      it "メールアドレスが空では登録できない" do
        @user.email = ''  # emailの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it "パスワードが空では登録できない" do
        @user.password = ''  # passwordの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it "パスワードが存在してもパスワード(確認)が空では登録できない" do
        @user.password_confirmation = ''  # password_confirmationの値を空にする
        @user.valid?
        expect(@user.errors[:password_confirmation]).to include "doesn't match Password"
      end

      it "重複したメールアドレスが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to include "has already been taken"
      end

      it "パスワードが5文字以下であれば登録できないこと" do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it "last_nameがない場合は登録できないこと" do
        @user = FactoryBot.build(:user, last_name: nil)
        @user.valid?
        expect(@user.errors[:last_name]).to include "can't be blank"
      end

      it "last_name_kanaがない場合は登録できないこと" do
        @user = FactoryBot.build(:user, last_name_kana: nil)
        @user.valid?
        expect(@user.errors[:last_name_kana]).to include "can't be blank"
      end

      it "first_nameがない場合は登録できないこと" do
        @user = FactoryBot.build(:user, first_name: nil)
        @user.valid?
        expect(@user.errors[:first_name]).to include "can't be blank"
      end

      it "first_name_kanaがない場合は登録できないこと" do
        @user = FactoryBot.build(:user, first_name_kana: nil)
        @user.valid?
        expect(@user.errors[:first_name_kana]).to include "can't be blank"
      end

      it "birth_dayがない場合は登録できないこと" do
        @user = FactoryBot.build(:user, birth_day: nil)
        @user.valid?
        expect(@user.errors[:birth_day]).to include "can't be blank"
      end

      it 'last_nameが全角入力でなければ登録できないこと' do
        @user = FactoryBot.build(:user, last_name: "ｱｲｳｴｵ")
        @user.valid?
        expect(@user.errors[:last_name]).to include "is invalid"
      end

      it 'first_nameが全角入力でなければ登録できないこと' do
        @user = FactoryBot.build(:user, first_name: "ｱｲｳｴｵ")
        @user.valid?
        expect(@user.errors[:first_name]).to include "is invalid"
      end

      it 'last_name_kanaが全角カタカナでなければ登録できないこと' do
        @user = FactoryBot.build(:user, last_name_kana: "あいうえお")
        @user.valid?
        expect(@user.errors[:last_name_kana]).to include "is invalid"
      end

      it 'first_name_kanaが全角カタカナでなければ登録できないこと' do
        @user = FactoryBot.build(:user, first_name_kana: "あいうえお")
        @user.valid?
        expect(@user.errors[:first_name_kana]).to include "is invalid"
      end
    end     
  end
end
