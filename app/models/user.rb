class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

      # バリデーションの設定(空の文字列を保存させない為と一意性制約)
      validates :username,               presence: true
      VALID_PASSWORD_REGEX = /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/i.freeze
      validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数を両方含む必要があります'}
      validates :last_name,              presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } # ここがユーザー本名全角の正規表現
      validates :last_name_kana,         presence: true, format: {with: /\A[ァ-ヶー－]+\z/ } # ここがフリガナ全角の正規表現
      validates :first_name,             presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } # ここがユーザー本名全角の正規表現
      validates :first_name_kana,        presence: true, format: {with: /\A[ァ-ヶー－]+\z/ } # ここがフリガナ全角の正規表現
      validates :birth_day,              presence: true
      
      # アソシエーション
      has_many :items,          dependent: :destroy
      has_many :orders,         dependent: :destroy
end