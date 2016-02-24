ActiveAdmin.register Article do

  permit_params :title, :content, :image
  index do
    selectable_column
    id_column
    column :image
    column :title
    actions
  end
  form do |f|
    f.inputs do
      f.input :title
      f.input :content, :input_html => { :class => "tinymce" }
      f.input :image
    end
    f.actions
  end

  filter :title
  filter :created_at
end
