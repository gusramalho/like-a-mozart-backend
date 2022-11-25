class Product < ApplicationRecord
  enum family: [
    :wind,
    :keyboard,
    :percussion,
    :string
  ]

  belongs_to :category
  belongs_to :brand
end
