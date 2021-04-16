class FavoritesController < ApplicationController
  def index
    @favorite_topics = current_user.favorite_topics
  end
  
  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.topic_id = params[:topic_id]
    #binding.pry
    if favorite.save
      redirect_to topics_path, success: 'お気に入りに成功しました'
    else
      redirect_to topics_path, danger: 'お気に入りに失敗しました'
    end
  end
  # 削除実装（rails07 課題）
  def destroy
    
    Favorite.find_by(topic_id: params[:topic_id], user_id: current_user.id).destroy
    redirect_to topics_path, success: 'お気に入りを削除しました'
    
    
  end
end
