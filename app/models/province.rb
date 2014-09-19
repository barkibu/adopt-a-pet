class Province < ActiveRecord::Base
  validates :ine_name, presence: true
  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true

  before_validation :set_slug

  def set_slug
    self.slug = name.parameterize
  end

  def to_param
    slug
  end
end
