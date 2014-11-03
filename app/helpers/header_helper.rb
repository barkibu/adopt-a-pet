module HeaderHelper
  def pet_menu_title(specie)
    "#{(specie.try(:to_s) || 'Animales').capitalize} en adopción"
  end

  def pet_submenu_links(specie)
    links = []

    if specie && specie.key_without_pet?
      provinces = Pet.provinces_count_by_specie(specie.key).keys
      provinces.each do |province|
        links << link_province_path(specie, Province.find(province))
      end
    else
      links << link_to('Perros en adopción', adopt_species_path(specie: Specie.find_by_key(:dog)))
      links << link_to('Gatos en adopción', adopt_species_path(specie: Specie.find_by_key(:cat)))
    end
    links
  end
end
