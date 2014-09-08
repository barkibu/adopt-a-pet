ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :name
    column :role
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :name
  filter :email
  filter :role, as: :check_boxes, collection: User.roles.keys

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :role
      f.input :email
      f.input :sign_in_count
    end
    f.actions
  end
end
