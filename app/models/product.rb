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

  scope :from_family, -> (family) { where(family: family) }
  scope :from_categories, -> (category_ids) { where(category_id: category_ids) }
  scope :from_brands, -> (brand_ids) { where(brand_id: brand_ids) }
end
