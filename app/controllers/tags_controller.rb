class TagsController < ApplicationController

  def index
    @tags = ActsAsTaggableOn::Tag.most_used
 end

  def show
    @prototypes = Prototype.eager_load(:user).order('likes_count DESC').tagged_with(params[:name])
  end

end
