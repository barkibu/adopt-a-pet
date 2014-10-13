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
      "Adopta a #{specie_with_preposition(specie)}",
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

  def self.extra_title(specie)
    "Al adoptar a #{specie_with_preposition(specie)} tendrás un amigo fiel para toda
    la vida que te ayudará a sonreír hasta en los momentos más difíciles."
  end

  def self.specie_with_preposition(specie)
    I18n.t "species_prepositions.#{specie}"
  end

  def self.link_title_for_specie(specie)
    "#{Specie.to_s(specie).capitalize} en adopción"
  end

  def self.link_title_for_province(specie, province)
    specie_text = link_title_for_specie(specie)
    "#{specie_text} en #{province.name}"
  end

  def self.link_title_for_breed(specie, province, breed)
    province_text = link_title_for_province(specie, province)
    "#{province_text} de la raza #{breed}"
  end
end
