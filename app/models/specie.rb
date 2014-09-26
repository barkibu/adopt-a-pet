class Specie
  PARAMS = { dog: 'perros', cat: 'gatos', pet: 'mascotas' }

  def self.find_by_specie!(specie)
    if PARAMS.values.include? specie
      PARAMS.key specie
    else
      raise ActiveRecord::RecordNotFound
    end
  end

  def self.find_by_specie(specie)
    if PARAMS.values.include? specie
      PARAMS.key specie
    else
      :pet
    end
  end

  def self.to_s(key)
    Specie::PARAMS[key]
  end
end
