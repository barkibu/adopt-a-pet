require 'rails_helper'

RSpec.describe HeaderHelper do
  let(:dog) { Specie.find_by_key(:dog) }

  describe '#pet_menu_title' do
    it 'returns the default pet menu title' do
      expect(helper.pet_menu_title(nil)).to eq('Animales en adopción')
    end

    it 'returns dog menu title when we are watching dogs' do
      expect(helper.pet_menu_title(dog)).to eq('Perros en adopción')
    end
  end

  describe '#pet_submenu_links' do
    it 'returns the default pet submenu links' do
      links = helper.pet_submenu_links(nil)

      expect(links.first).to include('Perros en adopción')
      expect(links.first).to include(adopt_species_path(specie: 'perros'))

      expect(links.second).to include('Gatos en adopción')
      expect(links.second).to include(adopt_species_path(specie: 'gatos'))
    end

    it 'returns localized pet submenu links when we are watching dogs' do
      allow(Pet).to receive(:provinces_count_by_specie).and_return(8 => '', 46 => '')
      links = helper.pet_submenu_links(dog)

      expect(links.first).to include('Perros en adopción en Barcelona')
      expect(links.first).to include(adopt_species_path(specie: 'perros', province: 'barcelona'))

      expect(links.second).to include('Perros en adopción en Valencia')
      expect(links.second).to include(adopt_species_path(specie: 'perros', province: 'valencia'))
    end
  end
end
