ActiveAdmin.register Gallery do
  permit_params :title, :image, :images_category_id
  menu false
  index do
    selectable_column
    id_column
    column :image do |img|
      image_tag(img.image.url(:thumb))
    end
    column :title
    column :images_category_id do |gal|
      ImagesCategory.find(gal.images_category_id).title if gal.images_category_id.present?
    end
    actions
  end
  form do |f|
    f.inputs do
      f.input :title
      f.input :images_category_id, :as => :select, :collection => ImagesCategory.all, :prompt => 'Выберите категорию'
      f.input :image, as: :file, :hint => f.image_tag(f.object.image.url(:thumb))
    end
    f.actions
  end


end
