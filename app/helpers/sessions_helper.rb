module SessionsHelper
  
  # 引数に渡されたユーザーオブジェクトでログインする
  def log_in(user)
    session[:user_id] = user.id
  end
  
  # セッションと@current_userを破棄します。
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end
  
  def logged_in?
    !current_user.nil?
  end
end
