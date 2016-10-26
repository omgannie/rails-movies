class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      if reviewer_key_params
        @user.update_attributes(trusted_reviewer: true)
      end
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def reviewer_key_params
    params.require(:user).permit(:key)[:key] == "monkey"
  end
end
