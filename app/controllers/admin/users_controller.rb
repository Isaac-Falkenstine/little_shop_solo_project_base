class Admin::UsersController < ApplicationController
  before_action :require_admin

  def edit
    @user = User.find_by(slug: params[:slug])
  end

  def update
    @user = User.find_by(slug: params[:slug])
    @user.update(user_params)
      flash[:success] = "The user's slug was successfully updated."
      redirect_to user_path(@user)
  end

  
  private

  def user_params
    params.require(:user).permit(:slug)
  end

  def require_admin
   redirect_to root_path unless current_admin?
  end
end
