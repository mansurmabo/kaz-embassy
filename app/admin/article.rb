ActiveAdmin.register Article do

  permit_params :title, :text, :image

  index do
    selectable_column
    id_column
    column :image
    column :title
    column :text
    actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :text
      f.input :image
    end
    f.actions
  end

  filter :title
  filter :created_at
end
