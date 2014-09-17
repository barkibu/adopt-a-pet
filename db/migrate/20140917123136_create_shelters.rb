class CreateShelters < ActiveRecord::Migration
  def change
    create_table :shelters do |t|
      t.string :name
      t.text :description
      t.string :web_url
      t.string :location
      t.attachment :logo

      t.timestamps
    end
  end
end
