class TagsController < ApplicationController

  def index
    @tags = ActsAsTaggableOn::Tag.most_used
 end

  def show
    @prototypes = Prototype.tagged_with(params[:name])
  end

end
