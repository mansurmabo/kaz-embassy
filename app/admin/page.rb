ActiveAdmin.register Page do
  menu false
  config.per_page = 20
  permit_params :title, :en_title, :content, :en_content, :category_id
  index do
    selectable_column
    id_column
    column :title
    column :category do |page|
      Category.find(page.category_id).name
    end
    actions
  end
  show do
    attributes_table 'Русский' do
      row :title
      row :content
    end
    attributes_table 'English' do
      row :en_title
      row :en_content
    end
  end
  form do |f|
    tabs do
      tab 'Русский' do
        f.inputs do
          f.input :title
          f.input :category_id, :as => :select, :collection => Category.all
          f.input :content, :as => :ckeditor
        end
      end
      tab 'English' do
        f.inputs do
          f.input :en_title
          f.input :en_content, :as => :ckeditor
        end
      end
    end
    f.actions
  end

  filter :title
  filter :category_id
  filter :created_at

end
