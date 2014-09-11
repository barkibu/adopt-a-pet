class RenameStateToStatusFromPets < ActiveRecord::Migration
  def change
    rename_column :pets, :state, :status
  end
end
