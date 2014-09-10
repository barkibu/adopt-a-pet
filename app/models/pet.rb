class Pet < ActiveRecord::Base
  include Filterable

  paginates_per 24

  enum ages: [:young, :adult]
  enum sex: [:male, :female]
  enum state: [:adoption, :adopted]
  enum size: [:small, :medium, :big]
  enum specie: [:dog, :cat]

  after_initialize :set_default_state, :if => :new_record?

  validates :name, presence: true
  validates :specie, presence: true
  validates :breed, presence: true
  validates :sex, presence: true
  validates :description, presence: true
  validates :location, presence: true

  belongs_to :user

  scope :filter_age, ->(value) { where(age: value) }
  scope :filter_size, ->(value) { where(size: value) }
  scope :filter_specie, ->(value) { where(specie: value) }

  def set_default_state
    self.state ||= :adoption
  end

  def self.filtering_params(params)
    result = {}

    result[:specie] = get_enum_values params, :species
    result[:size] = get_enum_values params, :sizes
    result[:age] = get_enum_values params, :ages

    result
  end
end
