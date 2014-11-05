module Filterable
  extend ActiveSupport::Concern

  module ClassMethods
    def filter(params)
      results = self.where(nil)
      params.each do |key, value|
        results = results.public_send("filter_#{key}", value) if value.present?
      end
      results
    end

    def get_enum_values(params, enum)
      enum_values = self.public_send(enum)
      filtered_params = params.slice *enum_values.keys
      filtered_params.select{ |k, v| v == '1' }.keys.map {|x| enum_values[x]}
    end
  end
end
