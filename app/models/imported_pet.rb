class ImportedPet < ActiveRecord::Base
  belongs_to :pet

  def add_fail_to_log(fail_message)
    if fail_logs?
      self.fail_logs = "#{fail_logs}\n\n#{fail_message}"
    else
      self.fail_logs = fail_message
    end
  end
end
