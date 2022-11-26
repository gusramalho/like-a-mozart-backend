class ProductBlueprint < Blueprinter::Base
  identifier :id
  field :name
  field :description
  association :brand, blueprint: BrandBlueprint
  association :category, blueprint: CategoryBlueprint
  field :price
  field :family
  field :image_url
end
