class Comment < ApplicationRecord
  #Rails07（確認テスト）
  belongs_to :user
  belongs_to :topic
end
