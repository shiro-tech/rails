class CommentsController < ApplicationController
  #Rails07（確認テスト）
  def index
    @comment_topics = Comment.all.includes(:comment_users)
  end
  
  def new
    @comment = Comment.new
    @topic_id = params["topic_id"]
  end
  
  def logged_in?
    !current_user.nil?
  end
  
  def create
    @comment = current_user.comments.new(comment_params)
    
    if @comment.save
      redirect_to topics_path, success: 'コメントに成功しました'
    else
      redirect_to topics_path, danger: 'コメントに失敗しました'
    end
  end
  
private
  def comment_params
    params.require(:comment).permit(:text, :topic_id)
  end
end
