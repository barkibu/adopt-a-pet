ActiveAdmin.register Pet do
  permit_params :age, :breed, :description, :location, :more_info_url, :name, :sex, :size, :specie, :urgent

  filter :name
  filter :sex, as: :check_boxes, collection: Pet.sexes.keys
  filter :status, as: :check_boxes, collection: Pet.statuses.keys
  filter :size, as: :check_boxes, collection: Pet.sizes.keys

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :specie, as: :check_boxes, collection: Pet.species.keys
      f.input :breed
      f.input :sex, as: :select, collection: Pet.sexes.keys
      f.input :description
      f.input :location
      f.input :age
      f.input :size, as: :select, collection: Pet.sizes.keys
      f.input :more_info_url
      f.input :urgent
    end
    f.actions
  end
end
