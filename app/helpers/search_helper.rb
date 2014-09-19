module SearchHelper
  def check_specie_animals?(params)
    params[:specie] == 'animales'
  end

  def check_specie_dog?(params)
    check_specie_animals?(params) || params[:specie] == 'perros'
  end

  def check_specie_cat?(params)
    check_specie_animals?(params) || params[:specie] == 'gatos'
  end
end
