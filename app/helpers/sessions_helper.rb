module SessionsHelper
  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  def authenticate_user
    if session[:user_id].nil?
      redirect_to(login_path, flash: { error: "You need to login first" })
    else
      current_user
    end
  end

  def login(user)
    session[:user_id] = user.id
  end
end
