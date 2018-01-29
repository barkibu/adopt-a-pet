module SpeciesHelper
  def tab_link_for_specie(specie)
    specie_text = if specie.key == :pet
                    t('all')
                  else
                    specie.to_s.capitalize
                  end
    klasses = ['tab-link']
    klasses << 'is-active' if specie.first?
    link_to specie_text, '#', class: klasses
  end
end
