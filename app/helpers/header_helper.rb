module HeaderHelper
  def pet_menu_title(specie)
    "#{(specie || 'Animales').capitalize} en adopción"
  end

  def pet_submenu_links(specie)
    links = []

    specie_key = Specie.find_by_specie(specie)
    if Specie.key_without_pet?(specie_key)
      provinces = Pet.provinces_count_by_specie(specie_key).keys
      provinces.each do |province|
        links << link_province_path(specie_key, Province.find(province))
      end
    else
      links << link_to('Perros en adopción', adopt_species_path(specie: Specie.to_s(:dog)))
      links << link_to('Gatos en adopción', adopt_species_path(specie: Specie.to_s(:cat)))
    end
    links
  end
end
