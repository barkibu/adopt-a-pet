class CreateImportedPets < ActiveRecord::Migration
  def change
    create_table :imported_pets do |t|
      t.references :pet, index: true
      t.text :data
      t.text :fail_logs

      t.timestamps
    end
  end
end
