class SearchParams
  def self.get(params)
    filter_keys = Pet.sizes.keys + Pet.ages.keys
    params.slice(*filter_keys.map(&:to_sym))
  end

  def self.species_to_url_params(params)
    key = if params[:dog] and params[:cat]
      :pet
    elsif params[:dog]
      :dog
    elsif params[:cat]
      :cat
    else
      :pet
    end
    Specie.find_by_key(key).to_s
  end

  def self.valid_province(params)
    return unless params[:province]
    Province.where(slug: params[:province]).count == 1
  end
end
