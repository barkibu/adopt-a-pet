class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.string :specie
      t.string :breed
      t.integer :sex
      t.text :description
      t.string :location
      t.integer :state
      t.integer :age
      t.integer :size
      t.string :more_info_url
      t.boolean :urgent

      t.timestamps
    end
  end
end
