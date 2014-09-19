class Specie
  PARAMS = { dog: 'perros', cat: 'gatos', animals: 'animales' }

  def self.find_by_specie!(specie)
    if PARAMS.values.include? specie
      PARAMS.key specie
    else
      raise ActiveRecord::RecordNotFound
    end
  end
end
