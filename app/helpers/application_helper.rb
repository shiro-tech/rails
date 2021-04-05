module ApplicationHelper[]
  #ナビゲーション実装（controllerとともに必要）→”DRYコード入力後は不要”
  #def current_user #現在ログインしているUserへ返すメソッド
  #@current_user ||= User.find_by(id: session[:user_id])
  #end
  
  #def logged_in? #ログインしているかどうか確認するためのメソッド
    #!current_user.nil?
  #end
end
