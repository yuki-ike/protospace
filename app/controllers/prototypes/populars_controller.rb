class Prototypes::PopularsController < ApplicationController
  def index
    @prototypes = Prototype.eager_load(:user, :tags).order('likes_count DESC').page(params[:page])
  end
end
