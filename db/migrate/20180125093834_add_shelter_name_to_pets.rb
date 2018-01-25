class AddShelterNameToPets < ActiveRecord::Migration
  def change
    add_column :pets, :shelter_name, :string
  end
end
