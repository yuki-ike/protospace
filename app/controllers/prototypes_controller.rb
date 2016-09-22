class PrototypesController < ApplicationController
  def index
    @prototypes = Prototype.includes(:user).all
  end

  def new
    @prototype = Prototype.new
    @prototype_images = @prototype.contents.build
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    prototype = Prototype.find(params[:id])
    if prototype.user_id == current_user.id
      prototype.update(prototype_params)
      redirect_to root_path
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    if prototype.user_id == current_user.id
      prototype.destroy
      redirect_to root_path
    end
  end

  private
  def prototype_params
    params.require(:prototype).permit(
      :title,
      :catch_copy,
      :concept,
      contents_attributes:[:id, :content, :status]).merge(user_id: current_user.id)
  end
end
