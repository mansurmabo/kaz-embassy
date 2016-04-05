ActiveAdmin.register Category do
  menu false
  permit_params :name
  index do
    selectable_column
    id_column
    column :name
    actions
  end
  show do
    attributes_table do
      row :name
    end
  end
  form do |f|
    f.inputs do
      f.input :name
    end
    f.actions
  end

  filter :name
  filter :created_at

end
