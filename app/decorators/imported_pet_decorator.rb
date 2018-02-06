class ImportedPetDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def logs_truncated
    logs.truncate(30) if logs
  end

  def data_truncated
    data.truncate(30) if data
  end

  def data_to_json
    if data.is_a? String
      JSON.parse data.gsub(/(\bnil\b)/, '""').gsub('=>', ':')
    else
      data
    end
  end
end
