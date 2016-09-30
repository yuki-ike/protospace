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
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      flash[:success] = 'Prototype was successfully created.'
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comments = @prototype.comments.includes(:user)
    if current_user.present?
    @like = Like.find_by(user_id: current_user.id, prototype_id: params[:id])
    end
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    prototype = Prototype.find(params[:id])
    if prototype.user_id == current_user.id
      prototype.update(prototype_params)
      flash[:success] = 'Update was successfully created.'
      redirect_to root_path
    else
      render :edit
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
