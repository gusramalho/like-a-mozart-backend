class CategoriesController < ApplicationController

  def index
    @categories = Category.active
    
    render json: {
      categories: CategoryBlueprint.render_as_hash(@categories)
    } 
  end
end
