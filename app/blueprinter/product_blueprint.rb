class ProductBlueprint < Blueprinter::Base
  identifier :id
  field :name
  field :description
  field :price
  field :family
  field :image_url
  association :brand, blueprint: BrandBlueprint
  association :category, blueprint: CategoryBlueprint
end