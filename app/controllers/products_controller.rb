class ProductsController < ApiController
  before_action :validate_required_variables, only: [:index]

  def index
    @products = Product
      .joins(:brand)
      .joins(:category)
      .is_active

    @products = @products.where_category_in(params[:category]) if params[:category].present?
    @products = @products.where_brand_in(params[:brand]) if params[:brand].present?
    @products = @products.page(params[:page]).per(params[:size])

    render json: {
      products: ProductBlueprint.render_as_hash(@products),
      size: @products.count,
      page: params[:page].to_i
    } 
  end

  private 

  def validate_required_variables
    unless params[:page].present? && params[:size].present?
      render status: 400, json: {
        error: "Missing path variables"
      }
    end
  end
end
