class SearchParams
  def initialize(params)
    @params = params
  end

  def get
    filter_keys = Pet.sizes.keys + Pet.ages.keys
    @params.slice(*filter_keys.map(&:to_sym))
  end

  def species_to_url_params
    key = if @params[:dog] and @params[:cat]
      :pet
    elsif @params[:dog]
      :dog
    elsif @params[:cat]
      :cat
    else
      :pet
    end
    Specie.find_by_key(key).to_s
  end

  def valid_province
    return unless @params[:province]
    Province.where(slug: @params[:province]).count == 1
  end
end
