ActiveAdmin.register ImagesCategory do

  menu false
  permit_params :title
  index do
    selectable_column
    id_column
    column :title
    actions
  end
  form do |f|
    f.inputs do
      f.input :title
    end
    f.actions
  end

  filter :title
  filter :created_at

end
