class AddDeletedAtToPets < ActiveRecord::Migration
  def change
    add_column :pets, :deleted_at, :datetime
    add_index :pets, :deleted_at
  end
end
