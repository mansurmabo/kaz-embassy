ActiveAdmin.register Event do
  menu priority: 10
  config.per_page = 20
  permit_params :title, :date_st, :date_st, :image, :site
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
    actions
  end
  form do |f|
    f.inputs do
      f.input :title
      f.input :date_st, :as => :datepicker
      f.input :date_end, :as => :datepicker
      f.input :site
      f.input :image, as: :file, :hint => f.image_tag(f.object.image.url(:thumb))
    end
    f.actions
  end

  filter :title
  filter :created_at

end
