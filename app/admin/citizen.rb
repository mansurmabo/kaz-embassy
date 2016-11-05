ActiveAdmin.register Citizen do

  config.per_page = 20

  index do
    selectable_column
    id_column
    column t :photo do |img|
      image_tag(img.photo.url(:thumb))
    end
    column 'ФИО' do |citizen|
      span(link_to("#{citizen.surname} #{citizen.name} #{citizen.father_name}", admin_citizen_path(citizen)))
    end
    column t :birthday
    column t :nationality
    column t :marital_status
    column t :education
    column t :departure_reason
    column t :last_kaz_address
    column t :kaz_work_place
    column t :current_country
    column t :current_address
    column t :phone
    column :created_at
    actions
  end

  show do |citizen|

    panel "Основные данные" do
      attributes_table_for citizen do

        row t :photo do |img|
          image_tag(img.photo.url(:medium))
        end
        row t :surname
        row t :name
        row t :father_name
        row t :birthday
        row t :nationality
        row t :marital_status
      end
    end
    panel "Паспортные данные" do
      attributes_table_for citizen do

        row 'Тип проездного документа' do
          citizen.citizen_passport.pass_type
        end
        row 'Серия' do
          citizen.citizen_passport.series
        end
        row 'Номер' do
          citizen.citizen_passport.number
        end
        row 'Дата Выдачи' do
          citizen.citizen_passport.date_of_issue
        end
        row 'Срок Действия' do
          citizen.citizen_passport.date_of_validity
        end

        row 'Срок Действия' do
          citizen.citizen_passport.issued_by
        end
        panel "Лица внесенные в паспорт" do
          attributes_table_for citizen do
            citizen.citizen_passport.passport_people.each do |person|
              row 'ФИО' do
                person.fullname
              end
              row 'Дата рождения' do
                person.birthday
              end
            end
          end
        end

      end
    end
    panel "Дополнительные данные" do
      attributes_table_for citizen do

        row t :education
        row t :departure_reason
        row t :last_kaz_address
        row t :kaz_work_place
        row t :current_country
        row t :current_address
        row t :phone
      end
    end

    panel "Родственники в РК" do
      relation_in_kz = citizen.citizen_relations.where(in_kz: true)
      attributes_table_for citizen do
        relation_in_kz.each do |person|
          row 'ФИО даные' do
            person.fullname
          end
        end
      end
    end
    panel "Родственники за пределами РК" do
      relation_out_kz = citizen.citizen_relations.where(in_kz: false)
      attributes_table_for citizen do
        relation_out_kz.each do |person|
          row 'ФИО даные' do
            person.fullname
          end
        end
      end
    end
  end
end
