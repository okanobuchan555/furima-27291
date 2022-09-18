class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

      # バリデーションの設定(空の文字列を保存させない為と一意性制約)
      validates :username,               presence: true
      validates :email,                  presence: true, format: {with: /\A\S+@\S+\.\S+\z/ }
      validates :password,               presence: true, format: {with: /\A[a-z\d]{6}+\z/i } # ここが半角英数字混合で6文字以上の正規表現
      validates :encrypted_password,     presence: true, format: {with: /\A[a-z\d]{6}+\z/i } # ここが半角英数字混合で6文字以上の正規表現
      validates :last_name,              presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ } # ここがユーザー本名全角の正規表現
      validates :last_name_kana,         presence: true, format: {with: /\A[ァ-ヶー－]+\z/ } # ここがフリガナ全角の正規表現
      validates :first_name,             presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ } # ここがユーザー本名全角の正規表現
      validates :first_name_kana,        presence: true, format: {with: /\A[ァ-ヶー－]+\z/ } # ここがフリガナ全角の正規表現
      validates :birth_day,              presence: true
    
      # アソシエーション
      has_many :items,          dependent: :destroy
      has_many :buyers,         dependent: :destroy
end
