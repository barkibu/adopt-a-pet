class CreatePetPictures < ActiveRecord::Migration
  def change
    create_table :pet_pictures do |t|
      t.references :pet, index: true
      t.attachment :asset
      t.timestamps
    end
  end
end
