require 'rails_helper'

describe User do
  describe '#create' do

      # 入力されている場合のテスト ▼

      it "全ての項目の入力が存在すれば登録できること" do
        user = build(:user)
        expect(user).to be_valid
      end

      # nul:false, presence: true のテスト ▼

      it "usernameがない場合は登録できないこと" do
        user = build(:user, username: nil)
        user.valid?
        expect(user.errors[:username]).to include("を入力してください")
      end

      it "emailがない場合は登録できないこと" do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include("を入力してください")
      end

      it "passwordがない場合は登録できないこと" do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("を入力してください")
      end

      it "encrypted_passwordがない場合は登録できないこと" do
        user = build(:user, encrypted_password: nil)
        user.valid?
        expect(user.errors[:encrypted_password]).to include("を入力してください")
      end

      it "last_nameがない場合は登録できないこと" do
        user = build(:user, last_name: nil)
        user.valid?
        expect(user.errors[:last_name]).to include("を入力してください")
      end

      it "last_name_kanaがない場合は登録できないこと" do
        user = build(:user, last_name_kana: nil)
        user.valid?
        expect(user.errors[:last_name_kana]).to include("を入力してください")
      end

      it "first_nameがない場合は登録できないこと" do
        user = build(:user, first_name: nil)
        user.valid?
        expect(user.errors[:first_name]).to include("を入力してください")
      end

      it "first_name_kanaがない場合は登録できないこと" do
        user = build(:user, first_name_kana: nil)
        user.valid?
        expect(user.errors[:first_name_kana]).to include("を入力してください")
      end

      it "birth_dayがない場合は登録できないこと" do
        user = build(:user, birth_day: nil)
        user.valid?
        expect(user.errors[:birth_day]).to include("を入力してください")
      end

      # パスワードの文字数テスト ▼

      it "passwordが6文字以上であれば登録できること" do
        user = build(:user, password: "123456", encrypted_password: "123456")
        expect(user).to be_valid
      end

      it "passwordが5文字以下であれば登録できないこと" do
        user = build(:user, password: "12345", encrypted_password: "12345")
        user.valid?
        expect(user.errors[:encrypted_password]).to include("は6文字以上で入力してください")
      end

      # email 一意性制約のテスト ▼

      it "重複したemailが存在する場合登録できないこと" do
        user = create(:user)
        another_user = build(:user, email: user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to include("はすでに存在します")
      end

      # 確認用パスワードが必要であるテスト ▼

      it "passwordが存在してもencrypted_passwordがない場合は登録できないこと" do
        user = build(:user, encrypted_password: "")
        user.valid?
        expect(user.errors[:encrypted_password]).to include("を入力してください", "は6文字以上で入力してください")
      end

      # 本人確認名前全角入力のテスト ▼

      it 'last_nameが全角入力でなければ登録できないこと' do
        user = build(:user, last_name: "ｱｲｳｴｵ")
        user.valid?
        expect(user.errors[:last_name]).to include("は不正な値です")
      end

      it 'first_nameが全角入力でなければ登録できないこと' do
        user = build(:user, first_name: "ｱｲｳｴｵ")
        user.valid?
        expect(user.errors[:first_name]).to include("は不正な値です")
      end

      # 本人確認カタカナ全角入力のテスト ▼

      it 'family_name_kanaが全角カタカナでなければ登録できないこと' do
        user = build(:user, last_name_kana: "あいうえお")
        user.valid?
        expect(user.errors[:last_name_kana]).to include("は不正な値です")
      end

      it 'first_name_kanaが全角カタカナでなければ登録できないこと' do
        user = build(:user, first_name_kana: "あいうえお")
        user.valid?
        expect(user.errors[:first_name_kana]).to include("は不正な値です")
      end
  end
end