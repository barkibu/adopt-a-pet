module PetsHelper
  def adopt_province_path(params)
    adopt_species_path(params.slice :specie, :province)
  end

  def adopt_breed_path(params)
    adopt_species_path(params.slice :specie, :province, :breed)
  end

  def link_province_path(specie, province)
    title = SEO.link_title_for_province(specie, province)
    path = adopt_province_path(specie: Specie.to_s(specie), province: province)
    link_to province.name, path, title: title
  end
end
