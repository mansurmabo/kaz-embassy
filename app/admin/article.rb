ActiveAdmin.register Article do
  menu false
  config.per_page = 20

  permit_params :title, :content, :en_title, :en_content, :kz_title, :kz_content, :image, :created_at, :type_id
  index do
    selectable_column
    id_column
    column :image do |img|
      image_tag(img.image.url(:thumb)) if img.image.present?
    end
    column :title
    column :kz_title
    column :en_title
    column :type_id do |article|
      Type.find(article.type_id).name if article.type_id.present?
    end
    column :created_at
    actions
  end
  show do
    attributes_table do
      row :image do |img|
        image_tag(img.image.url(:medium)) if img.image.present?
      end
      row :type_id do |article|
        Type.find(article.type_id).name if article.type_id.present?
      end
      row :title
      row :content

    end
    panel "Русский" do
      attributes_table do
        row :title
        row :content
      end
    end
    panel "Қазақша" do
      attributes_table do
        row :kz_title
        row :kz_content
      end
    end
    panel "English" do
      attributes_table do
        row :en_title
        row :en_content
      end
    end
  end
  form do |f|
    tabs do
      tab 'Русский' do
        f.inputs do
          f.input :title
          f.input :type_id, :as => :select, :collection => Type.all, :prompt => 'Выберите категорию новостей'
          f.input :content, :input_html => {:class => "ckeditor"}
          f.input :image, as: :file,  :hint => f.image_tag(f.object.image.present? ? f.object.image.url(:thumb) : '')
          f.input :created_at, :as => :datepicker
        end
      end
      tab 'Қазақша' do
        f.inputs do
          f.input :kz_title
          f.input :kz_content, :input_html => {:class => "ckeditor"}
        end
      end
      tab 'English' do
        f.inputs do
          f.input :en_title
          f.input :en_content, :input_html => {:class => "ckeditor"}
        end
        end

    end
    f.actions
  end

  filter :title
  filter :created_at
end
