class User < ApplicationRecord
  validates :name, presence: true, length: {maximum: 15}
  VALID_EMAIL_REGEX=/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}
  VALID_PASSWORD_REGEX=/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,100}+\z/i
  validates :password, presence: true, format: {with: VALID_PASSWORD_REGEX}
  
  has_secure_password
  
  has_many :topics
  has_many :favorites, dependent: :destroy
  has_many :favorite_topics, through: :favorites, source: 'topic'
  # コメント機能実装(確認テスト)
  has_many :comments, dependent: :destroy

  # #仮で実装　削除制限
  # def already_favorite?(topic)
  #   self.favorites.exists?(topic_id: topic.id)
  # end
  
end
