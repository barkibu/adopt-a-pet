module PetsHelper
  def adopt_province_path(params)
    adopt_species_path(params.slice :specie, :province)
  end

  def adopt_breed_path(params)
    adopt_species_path(params.slice :specie, :province, :breed)
  end

  def link_province_path(specie, province)
    specie_text = Specie.to_s(specie)
    title = "#{specie_text.capitalize} en adopción en #{province.name}"
    path = adopt_province_path(specie: specie_text, province: province)
    link_to province.name, path, title: title
  end
end
