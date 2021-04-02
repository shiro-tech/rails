class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(session_params)
    if user && user.autheticare(session_params)
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
  
  #課題仮入力
  private
  def session_params
  params.require(:user).permit(:email, :password)
  end
end
