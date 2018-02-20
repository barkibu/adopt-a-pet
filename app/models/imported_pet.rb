class ImportedPet < ActiveRecord::Base
  belongs_to :pet

  scope :without_pet, -> { where(pet_id: nil) }

  def add_log(message)
    self.logs = if logs?
                  "#{logs}\n\n#{message}"
                else
                  message
                end
  end
end
