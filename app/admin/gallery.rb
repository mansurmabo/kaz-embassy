ActiveAdmin.register Gallery do
  permit_params :title, :image, :imagescategory_id

  index do
    selectable_column
    id_column
    column :image do |img|
      image_tag(img.image.url(:thumb))
    end
    column :title
    column :imagecategory_id do |gal|
      ImagesCategory.find(gal.imagescategory_id).title if gal.imagescategory_id.present?
    end
    actions
  end
  form do |f|
    f.inputs do
      f.input :title
      f.input :imagescategory_id, :as => :select, :collection => ImagesCategory.all
      f.input :image, as: :file, :hint => f.image_tag(f.object.image.url(:thumb))
    end
    f.actions
  end


end
