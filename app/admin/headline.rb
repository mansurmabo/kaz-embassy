ActiveAdmin.register Headline do
  menu priority: 6

  permit_params :title, :kz_title, :en_title, :color, :height, :font_size, :font_color, :url, :show
  config.filters = false
  index do
    selectable_column
    id_column
    column :show
    column :title
    column :kz_title
    column :en_title
    column :color
    column :url
    column :font_size
    column :font_color
    column :height
    actions
  end
  show do
    attributes_table do
      row :show
      row :color
      row :title
      row :kz_title
      row :en_title
      row :url
      row :font_size
      row :font_color
      row :height
    end
  end
  form do |f|
    tabs do
      tab 'Русский' do
        f.object.font_color = "#FFFFFF"
        f.inputs do
          f.input :show
          f.input :title
          f.input :url
          f.input :color
          f.input :font_size
          f.input :font_color
          f.input :height
        end
      end
      tab 'Қазақша' do
        f.inputs do
          f.input :kz_title
        end
      end
      tab 'English' do
        f.inputs do
          f.input :en_title
        end
      end
    end

    f.actions

  end
end
