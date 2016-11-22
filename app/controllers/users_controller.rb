class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(update_params)
    redirect_to root_path
  end

  def show
    @user = User.find(params[:id])
    @prototypes = @user.prototypes
  end

  private
  def update_params
    params.require(:user).permit(:username, :member_of, :profile, :works, :image)
  end

end
