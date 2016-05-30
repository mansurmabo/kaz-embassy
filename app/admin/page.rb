ActiveAdmin.register Page do
  menu false
  config.per_page = 20
  permit_params :title, :en_title, :kz_title, :content, :en_content, :kz_content, :category_id
  index do
    selectable_column
    id_column
    column :title
    column :en_title
    column :kz_title
    column :category do |page|
      Category.find(page.category_id).name
    end
    actions
  end
  show do
    panel "Русский" do
      attributes_table_for page, :title, :content
      end
    panel "Қазақша" do
      attributes_table_for page, :kz_title, :kz_content
    end
    panel "English" do
      attributes_table_for page, :en_title, :en_content
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
      tab 'Қазақша' do
        f.inputs do
          f.input :kz_title
          f.input :kz_content, :as => :ckeditor
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
