class ImportedPet < ActiveRecord::Base
  belongs_to :pet

  def add_fail_to_log(fail_message)
    fail_message_formatted = "#{fail_message}\n"
    if fail_logs?
      self.fail_logs << fail_message_formatted
    else
      self.fail_logs = fail_message_formatted
    end
  end
end
