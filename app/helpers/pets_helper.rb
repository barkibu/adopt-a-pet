module PetsHelper
  def breadcrumb_specie_path(params)
    adopt_species_path(params.slice :specie)
  end

  def breadcrumb_province_path(params)
    adopt_species_path(params.slice :specie, :location)
  end

  def breadcrumb_breed_path(params)
    adopt_species_path(params.slice :specie, :location, :breed)
  end
end
