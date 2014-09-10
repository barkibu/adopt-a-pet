class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :integer
    add_column :users, :name, :string
    add_column :users, :phone, :string
    add_column :users, :address, :string
  end
end
