ActiveAdmin.register Gallery do
  permit_params :title, :image

  index do
    selectable_column
    id_column
    column :image do |img|
      image_tag(img.image.url(:thumb))
    end
    column :title
    actions
  end
  form do |f|
    f.inputs do
      f.input :title
      f.input :image, as: :file, :hint => f.image_tag(f.object.image.url(:thumb))
    end
    f.actions
  end


end
