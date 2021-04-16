class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.string :user_id, null: false
      t.string :integer
      t.integer :topic_id, null: false

      t.timestamps
      
      
    end
  end
end
