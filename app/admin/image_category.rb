ActiveAdmin.register ImagesCategory do

  menu false
  permit_params :title, :en_title, :kz_title
  index do
    selectable_column
    id_column
    column :title
    column :en_title
    column :kz_title
    actions
  end
  show do
    attributes_table do
      row :title
      row :en_title
      row :kz_title
    end
  end
  form do |f|
    tabs do
      tab "Русский" do
        f.inputs do
          f.input :title
        end
      end
      tab "Каз" do
        f.inputs do
          f.input :kz_title
        end
      end
      tab "English" do
        f.inputs do
          f.input :en_title
        end
      end
    end
    f.actions
  end

  filter :title
  filter :created_at

end
