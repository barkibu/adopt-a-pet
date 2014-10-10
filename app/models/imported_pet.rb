class ImportedPet < ActiveRecord::Base
  belongs_to :pet

  def add_log(message)
    if logs?
      self.logs = "#{logs}\n\n#{message}"
    else
      self.logs = message
    end
  end
end
