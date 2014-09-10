class AddIndexesToPets < ActiveRecord::Migration
  def change
    add_index :pets, [:location, :state]
    add_index :pets, [:specie, :size, :age]
  end
end
