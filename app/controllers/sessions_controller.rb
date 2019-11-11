class SessionsController < ApplicationController
  skip_before_action :authenticate_user, except: [:destroy]

  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:user][:email])
    if user.password == params[:user][:password]
      login(user)
      redirect_to(user_path(user), flash: { success: "Successfully logged in" })
    end
  end

  def destroy
    session.clear
    redirect_to(login_path, flash: { success: "You have logged out" })
  end
end
