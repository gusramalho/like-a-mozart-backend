class Brand < ApplicationRecord
  before_validation :set_slug

  validates :name, presence: true
  validates :slug, presence: true, uniqueness: { case_sensitive: false }

  def set_slug
    self.slug = self.name.parameterize
  end

  scope :active, -> { where(active: true) }
end
