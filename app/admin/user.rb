ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :role

  index do
    selectable_column
    id_column
    column :email
    column :role
    column :current_sign_in_at
    column :sign_in_count
    column :created_at

    actions
  end

  filter :email

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :role, as: :radio, collection: {Editor: 'editor', Moderator: 'moder', Administrator: 'admin'}
    end
    f.actions
  end

end
