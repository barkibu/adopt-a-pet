class SEO
  def self.default_description
    'Adopta a una mascota es un proyecto donde puedes
    buscar entre perros, gatos y otros animales de todas las
    protectoras de España. Así encontrarás a tu mascota ideal'
  end

  def self.default_title
    title_for_adopt(:pet, nil, nil)
  end

  def self.title_for_adopt(specie, province, _breed)
    title = [
      "Adopta a #{specie.with_preposition}",
      (('en ' + province) if province.present?).to_s
    ]
    title.select(&:present?).join(' ')
  end

  def self.title_for_show(pet)
    "Adopta a #{pet.name} #{pet.breed} en #{pet.province}"
  end

  def self.description_for_index(specie, province, breed, page)
    return default_description if specie.key == :pet && province.blank? && breed.blank? && page.blank?

    pagination = page.to_i > 1 ? " (página #{page})" : ''
    desc = [
      "Adopta a #{specie.with_preposition}",
      breed.presence.to_s,
      (('en ' + province) if province.present?).to_s
    ]
    "#{desc.select(&:present?).join(' ')}. Aquí encontrarás a tu mascota ideal#{pagination}."
  end

  def self.description_for_show(pet)
    desc = [
      "Adopta a #{pet.name}",
      (('de la raza ' + breed) if breed.present?).to_s,
      (('en ' + province) if pet.province.present?).to_s
    ]
    desc.select(&:present?).join(' ')
  end

  def self.extra_title(specie)
    "Al adoptar a #{specie.with_preposition} tendrás un amigo fiel para toda
    la vida que te ayudará a sonreír hasta en los momentos más difíciles."
  end

  def self.link_title_for_specie(specie)
    "#{specie.to_s.capitalize} en adopción"
  end

  def self.link_title_for_province(specie, province)
    specie_text = link_title_for_specie(specie)
    "#{specie_text} en #{province.name}"
  end

  def self.link_title_for_breed(specie, province, breed)
    province_text = link_title_for_province(specie, province)
    "#{province_text} de la raza #{breed}"
  end

  def self.link_name_for_province(specie, province)
    specie_text = specie.to_s.capitalize.to_s
    "#{specie_text} en #{province.name}"
 end

  def self.link_name_for_shelter(specie, shelter)
    specie_text = specie.to_s.capitalize.to_s
    "#{specie_text} en #{shelter}"
  end
end
