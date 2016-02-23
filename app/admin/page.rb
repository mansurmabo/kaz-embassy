ActiveAdmin.register Page do
  permit_params :title, :content, :category_id
  index do
    selectable_column
    id_column
    column :title
    column :category
    actions
  end
  form do |f|
    f.inputs do
      f.input :title
      f.input :content, :input_html => { :class => "tinymce" }
      f.input :category_id, :as => :select, :collection => Category.all
    end
    f.actions
  end

  filter :title
  filter :category_id
  filter :created_at


end
