# Copied from: http://blog.opsb.co.uk/long-running-rake-tasks-on-heroku
# More info: https://github.com/opsb/delayed_task

class PerformableTaskJob < Struct.new(:task)
  def perform
    system "rake #{task}"
  end
end
