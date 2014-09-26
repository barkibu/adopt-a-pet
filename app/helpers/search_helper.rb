module SearchHelper
  def check_specie?(params)
    params[:specie] == 'mascotas'
  end

  def check_specie_dog?(params)
    check_specie?(params) || params[:specie] == 'perros'
  end

  def check_specie_cat?(params)
    check_specie?(params) || params[:specie] == 'gatos'
  end
end
