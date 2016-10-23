class Prototypes::PopularsController < ApplicationController
  def index
    @prototypes = Prototype.eager_load(:user).includes(:tags).order('likes_count DESC')
  end
end
