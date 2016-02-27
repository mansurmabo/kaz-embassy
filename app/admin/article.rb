ActiveAdmin.register Article do

  permit_params :title, :content, :image, :created_at, :type_id
  index do
    selectable_column
    id_column
    column :image do |img|
      image_tag(img.image.url(:thumb))
    end
    column :title
    column :type_id do |article|
      Type.find(article.type_id).name

    end
    column :created_at
    actions
  end
  form do |f|
    f.inputs do
      f.input :title
      f.input :type_id, :as => :select, :collection => Type.all

      f.input :content, :input_html => { :class => "ckeditor" }
      f.input :image, as: :file, :hint => f.image_tag(f.object.image.url(:thumb))
      f.input :created_at
    end
    f.actions
  end

  filter :title
  filter :created_at
end
