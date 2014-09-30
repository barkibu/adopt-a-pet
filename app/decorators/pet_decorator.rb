class PetDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def adopt_specie_path
    specie = object.enum_to_s(:specie).pluralize.parameterize
    province = object.province
    breed = object.breed.parameterize

    h.adopt_specie_path(specie: specie, province: province, breed: breed, id: self)
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end

  def location_formatted
    if province_id
      location.sub(/\(.*\)/, '').strip
    else
      location
    end
  end

  def name_formatted
    name.titleize
  end

  def show_province?
    province.name != location_formatted
  end

  def breed_formatted
    breed.titleize
  end

  def specie_formatted
    Specie.to_s(object.specie.to_sym).titleize
  end
end
