class AddAssetProcessingToPetPicture < ActiveRecord::Migration
  def change
    add_column :pet_pictures, :asset_processing, :boolean
  end
end
