class UsersController < ApplicationController
  skip_before_action :authenticate_user, only: [:new, :create]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to(user_path(@user), flash: { success: "You have successfully signed up!" })
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
