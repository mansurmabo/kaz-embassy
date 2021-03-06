ActiveAdmin.register Event do
  menu priority: 7
  config.per_page = 20
  permit_params :title, :repeat, :date_st, :date_end, :image, :site
  index do
    selectable_column
    id_column
    column :image do |img|
      image_tag(img.image.url(:thumb))
    end
    column :title
    column :date_st
    column :date_end
    column :site
    column :repeat
    actions
  end
  show do
    attributes_table do
      row :image do |img|
        image_tag(img.image.url(:medium))
      end
      row :site
      row :date_st
      row :date_end
      row :repeat
    end
  end
  form do |f|
    f.inputs do
      f.input :title
      f.input :date_st, :as => :datepicker
      f.input :date_end, :as => :datepicker
      f.input :site
      f.input :image, as: :file, :hint => f.image_tag(f.object.image.url(:thumb))
      f.input :repeat
    end
    f.actions
  end

  filter :title
  filter :created_at

end
