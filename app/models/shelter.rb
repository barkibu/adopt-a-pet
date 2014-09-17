class Shelter < ActiveRecord::Base
  validates :name, presence: true
end
