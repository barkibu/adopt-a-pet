class Pet < ActiveRecord::Base
  include Filterable

  paginates_per 24

  enum ages: [:young, :adult]
  enum sex: [:male, :female]
  enum state: [:adoption, :adopted]
  enum size: [:small, :medium, :big]
  enum specie: [:dog, :cat]

  after_initialize :set_default_state, if: :new_record?

  validates :name, presence: true
  validates :specie, presence: true
  validates :breed, presence: true
  validates :sex, presence: true
  validates :description, presence: true
  validates :location, presence: true

  belongs_to :user
  has_many :pet_pictures, dependent: :destroy

  accepts_nested_attributes_for :pet_pictures, reject_if: :new_record?, allow_destroy: true

  scope :default_filter_and_order, -> { where(state: Pet.states[:adoption]).order('urgent DESC') }
  scope :filter_age, ->(value) { where(age: value) }
  scope :filter_location, ->(value) { where(location: value) }
  scope :filter_size, ->(value) { where(size: value) }
  scope :filter_specie, ->(value) { where(specie: value) }
  scope :near_from_location, ->(location, id) do
    filter_location(location)
    .where('id <> ?', id)
    .default_filter_and_order
    .limit(3)
  end

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

  def self.enum_to_s(enum, enum_value)
    I18n.t "activerecord.attributes.pet.#{enum.to_s.pluralize}.#{enum_value}"
  end
  def enum_to_s(enum)
    Pet.enum_to_s enum, public_send(enum)
  end
end
