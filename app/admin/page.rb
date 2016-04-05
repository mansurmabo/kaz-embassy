ActiveAdmin.register Page do
  menu false
  config.per_page = 20
  permit_params :title, :content, :category_id
  index do
    selectable_column
    id_column
    column :title
    column :category do |page|
      Category.find(page.category_id).name
    end
    actions
  end
  form do |f|
    f.inputs do
      f.input :title
      f.input :category_id, :as => :select, :collection => Category.all
      f.input :content, :as => :ckeditor
    end
    f.actions
  end

  filter :title
  filter :category_id
  filter :created_at

end
