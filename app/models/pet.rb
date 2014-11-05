class Pet < ActiveRecord::Base
  include Filterable

  paginates_per 24

  enum age: [:young, :adult]
  enum sex: [:male, :female]
  enum status: [:adoption, :adopted]
  enum size: [:small, :medium, :big]
  enum specie: [:dog, :cat]

  after_initialize :set_default_status, if: :new_record?

  validates :name, presence: true
  validates :specie, presence: true
  validates :breed, presence: true
  validates :sex, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :province_id, presence: true

  belongs_to :user
  belongs_to :province
  has_many :pet_pictures, dependent: :destroy
  has_one :imported_pet, dependent: :destroy

  accepts_nested_attributes_for :pet_pictures, reject_if: :new_record?, allow_destroy: true

  scope :default_filter_and_order, -> do
    where(status: Pet.statuses[:adoption])
    .order('urgent DESC, created_at DESC')
    .includes(:province, :pet_pictures)
  end
  scope :filter_age, ->(value) { where(age: value) }
  scope :filter_province, ->(value) { where(province_id: value) }
  scope :filter_size, ->(value) { where(size: value) }
  scope :filter_specie, ->(value) { where(specie: value) }
  scope :near_from_province, ->(province_id, specie, id) do
    filter_province(province_id)
    .where('id <> ?', id)
    .where(specie: Pet.species[specie])
    .default_filter_and_order
    .limit(3)
  end
  scope :count_by_province, ->(specie) { where(specie: Pet.species[specie]).group(:province_id).count }

  def set_default_status
    self.status ||= :adoption
  end

  def self.provinces_count_by_specie(specie, limit = 2)
    Pet.where(specie: Pet.species[specie]).group(:province_id).order('1 DESC').limit(limit).count
  end

  def self.filtering_params(params)
    result = {}

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
