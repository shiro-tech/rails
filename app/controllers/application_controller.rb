class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  add_flash_types :success, :into, :warning, :danger
  #ナビゲーション実装
  helper_method :current_user, :logged_in?#DRYコード
  
  def current_user #現在ログインしているUserへ返すメソッド
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def logged_in? #ログインしているかどうか確認するためのメソッド
    !current_user.nil?
  end
end
