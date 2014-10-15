class ImportedPet < ActiveRecord::Base
  belongs_to :pet

  scope :without_pet, -> { where(pet_id: nil) }

  def add_log(message)
    if logs?
      self.logs = "#{logs}\n\n#{message}"
    else
      self.logs = message
    end
  end
end
