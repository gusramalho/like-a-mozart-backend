class Category < ApplicationRecord
  before_validation :set_slug

  validates :name, presence: true
  validates :slug, presence: true, uniqueness: { case_sensitive: false }

  scope :active, -> { where(active: true) }

  def set_slug
    self.slug = self.name.parameterize
  end
end
