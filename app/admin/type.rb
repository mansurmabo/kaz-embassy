ActiveAdmin.register Type do
  menu false
  permit_params :name, :en_name
  index do
    selectable_column
    id_column
    column :name
    column :en_name
    actions
  end
  show do
    attributes_table do
      row :name
      row :en_name
    end
  end
  form do |f|
    tabs do
      tab 'Русский' do
        f.inputs do
          f.input :name
        end
      end
      tab 'English' do
        f.inputs do
          f.input :en_name
        end
      end
    end
    f.actions
  end

  filter :name
  filter :created_at


end
