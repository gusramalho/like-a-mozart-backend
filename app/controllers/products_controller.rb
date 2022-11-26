class ProductsController < ApiController
  before_action :validate_required_variables, only: [:index]

  def index
    @products = Product
      .joins(:brand)
      .joins(:category)
      .from_family(params[:family])

    @products = @products.from_categories(params[:category_ids]) if params[:category_ids].present?
    @products = @products.from_brands(params[:brand_ids]) if params[:brand_ids].present?
    @products = @products.page(params[:page]).per(params[:size])

    render json: {
      products: ProductBlueprint.render_as_hash(@products),
      size: @products.count,
      page: params[:page].to_i
    } 
  end

  private 

  def validate_required_variables
    unless params[:family].present? && params[:page].present? && params[:size].present?
      render status: 400, json: {
        error: "Missing path variables"
      }
    end
  end
end
