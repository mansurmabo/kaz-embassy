ActiveAdmin.register ThirdParty do
  menu priority: 5
  permit_params :link, :image
  index do
    selectable_column
    id_column
    column :image do |img|
      image_tag(img.image.url(:thumb))
    end
    column :link
    actions
  end
  form do |f|
    f.inputs do
      f.input :link
      f.input :image, as: :file, :hint => f.image_tag(f.object.image.url(:thumb))
    end
    f.actions
  end


end
