module SpeciesHelper
  def tab_link_for_specie(specie)
    specie_text = specie.to_s.capitalize
    klasses = ['tab-link']
    klasses << 'is-active' if specie.first?
    link_to specie_text, '#', class: klasses
  end
end
