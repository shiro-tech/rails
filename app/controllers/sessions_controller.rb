class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email_params)
    if user && user.authenticate(password_params[:password])
      log_in user
      redirect_to root_path, success: 'ログインに成功しました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end
  #ログアウト実装（sessionはログイン状態なため必要）
  def destroy
    log_out
    redirect_to root_url, info: 'ログアウトしました'
  end
  #sessionでユーザー情報の記録状態にする
  private
  def log_in(user)
    session[:user_id] = user.id
  end
  #sessionのログアウト実装
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
  #課題入力
  private
  def email_params
  params.require(:session).permit(:email)
  end
  
  private
  def password_params
    params.require(:session).permit(:password)
  end
  
  
end
