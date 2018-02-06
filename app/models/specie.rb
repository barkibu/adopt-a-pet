class Specie
  PARAMS = { dog: 'perros', cat: 'gatos', pet: 'mascotas' }.freeze

  attr_accessor :key, :value

  def initialize(key: :pet, value: PARAMS[:key])
    @key = key
    @value = value
  end

  def self.find_by_key(key)
    value = PARAMS[key]
    value ? new(key: key, value: value) : nil
  end

  def self.find_by_value(value)
    key = PARAMS.key value
    key ? new(key: key, value: value) : find_by_key(:pet)
  end

  def self.find_by_key!(key)
    raise ActiveRecord::RecordNotFound unless find_by_key(key)
  end

  def self.find_by_value!(value)
    key = PARAMS.key value
    key ? new(key: key, value: value) : raise(ActiveRecord::RecordNotFound)
  end

  def self.keys
    PARAMS.keys
  end

  def self.keys_without_pet
    PARAMS.keys.reject { |x| x == :pet }
  end

  def ==(another_specie)
    (key == another_specie.key) && (value == another_specie.value)
  end

  def to_s
    value
  end

  def key_without_pet?
    Specie.keys_without_pet.include? key
  end

  def first?
    key == PARAMS.keys.first
  end

  def with_preposition
    I18n.t "species_prepositions.#{key}"
  end
end
