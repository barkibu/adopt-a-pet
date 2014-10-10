namespace :tentacles do
  def launch(feed, importer, &block)
    Rails.logger.info "[tentacles:import:#{feed[:name]}]Importing..."
    importer.run(feed)
    Rails.logger.info "[tentacles:import:#{feed[:name]}]Done."
  end

  desc "Import all data from tentacles"
  task import: :environment do
    launch(Tentacles::Feeds::CIUDAD_ANIMAL_DOGS, Tentacles::Importer.new)
    launch(Tentacles::Feeds::CIUDAD_ANIMAL_CATS, Tentacles::Importer.new)
  end
end
