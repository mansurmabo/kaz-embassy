ActiveAdmin.register Event do
  menu priority: 10
  config.per_page = 20
  permit_params :title, :date, :image, :site
  index do
    selectable_column
    id_column
    column :image do |img|
      image_tag(img.image.url(:thumb))
    end
    column :title
    column :date
    column :site
    actions
  end
  form do |f|
    f.inputs do
      f.input :title
      f.input :date, :as => :datepicker
      f.input :site
      f.input :image, as: :file, :hint => f.image_tag(f.object.image.url(:thumb))
    end
    f.actions
  end

  filter :title
  filter :created_at

end
