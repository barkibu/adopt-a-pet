Rake::Task.tasks.each do |task|
  task "delay:#{task.name}" do
    Rake::Task["environment"].invoke
    Delayed::Job.enqueue PerformableTaskJob.new(task.name)    
    puts "Enqueued job: rake #{task.name}"
  end
end
