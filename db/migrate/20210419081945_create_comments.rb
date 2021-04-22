class CreateComments < ActiveRecord::Migration[5.2]
  #Rails07（確認テスト）
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :topic_id
      t.string :text

      t.timestamps
    end
  end
end
