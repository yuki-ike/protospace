class Prototypes::PopularsController < ApplicationController
  def index
    @prototypes = Prototype.order('likes_count DESC')
  end
end
