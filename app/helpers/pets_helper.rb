module PetsHelper
  def breadcrumb_specie_path(params)
    adopt_species_path(params.slice :specie)
  end

  def breadcrumb_province_path(params)
    adopt_species_path(params.slice :specie, :province)
  end

  def breadcrumb_breed_path(params)
    adopt_species_path(params.slice :specie, :province, :breed)
  end

  def link_province_path(specie, province)
    specie_text = Specie.to_s(specie)
    title = "#{specie_text.capitalize} en adopción en #{province.name}"
    path = breadcrumb_province_path(specie: specie_text, province: province)
    link_to province.name, path, title: title
  end
end
