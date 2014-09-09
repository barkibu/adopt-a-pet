class ChangeSpecieFromPets < ActiveRecord::Migration
  def up
    remove_index :pets, [:specie, :size, :age]
    remove_column :pets, :specie
    add_column :pets, :specie, :integer
    add_index :pets, [:specie, :size, :age]
  end

  def down
    remove_index :pets, [:specie, :size, :age]
    remove_column :pets, :specie
    add_column :pets, :specie, :string
    add_index :pets, [:specie, :size, :age]
  end
end
