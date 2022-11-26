class Product < ApplicationRecord
  enum family: [
    :wind,
    :keyboard,
    :percussion,
    :string
  ]

  belongs_to :category
  belongs_to :brand

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :family, presence: true
  validates :image_url, presence: true
end
