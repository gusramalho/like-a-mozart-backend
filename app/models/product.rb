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

  scope :is_active, -> { where(brand: { active: true }, category: { active: true }) }
  scope :where_category_in, -> (category_slugs) { joins(:category).where(category: { slug: category_slugs }) }
  scope :where_brand_in, -> (brand_slugs) { joins(:brand).where(brand: { slug: brand_slugs }) }
end
