class SEO
  def self.default_description
    'Adopta a una mascota es un proyecto donde puedes
    buscar entre perros, gatos y otros animales de todas las
    protectoras de España. Así encontrarás a tu mascota ideal'
  end

  def self.default_title
    'Adopta a una mascota'
  end

  def self.title_for_adopt(specie, province, breed)
    title = [
      "Adopta a #{specie}",
      "#{ ('en ' + province) if province.present?}"
    ]
    title.join(' ')
  end

  def self.title_for_show(pet)
    "Adopta a #{pet.name} #{pet.breed} en #{pet.province}"
  end

  def self.description_for_show(pet)
    default_description
  end
end
