class AddUrlToImportedPets < ActiveRecord::Migration

  class ImportedPet < ActiveRecord::Base
  end

  def change
    add_column :imported_pets, :url, :string

    ImportedPet.find_in_batches do |group|
      group.each do |imported_pet|
        json_data = JSON.parse imported_pet.data.gsub(/(\bnil\b)/, "\"\"").gsub('=>', ':')
        imported_pet.url = json_data['more_info_url']
        imported_pet.save!
      end
    end

    add_index :imported_pets, [:url]
  end
end
