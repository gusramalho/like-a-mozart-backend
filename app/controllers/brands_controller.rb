class BrandsController < ApplicationController

  def index
    @brands = Brand.active
    
    render json: {
      brands: BrandBlueprint.render_as_hash(@brands)
    } 
  end
end
