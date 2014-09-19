class AddProvinceRefToPets < ActiveRecord::Migration
  def change
    add_reference :pets, :province, index: true
  end
end
