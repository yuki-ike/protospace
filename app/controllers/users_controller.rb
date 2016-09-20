class UsersController < ApplicationController

  def edit
  end

  def update
    current_user.update(update_params)
    redirect_to "/"
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
