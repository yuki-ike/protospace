class PrototypesController < ApplicationController
  def index
    @prototypes = Prototype.includes(:user).all
  end

  def new
    @prototype = Prototype.new
    @main_image = @prototype.contents.build
    @sub_images = @prototype.contents.build
  end

  def create
    Prototype.create(prototype_params)
    redirect_to "/"
  end
  def show
    @prototype = Prototype.find(params[:id])
  end

  private
  def prototype_params
    params.require(:prototype).permit(
      :title,
      :catch_copy,
      :content,
      contents_attributes:[:id, :content, :status]).merge(user_id: current_user.id)
  end
end
