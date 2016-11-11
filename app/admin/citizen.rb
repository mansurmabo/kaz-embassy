ActiveAdmin.register Citizen do
  config.per_page = 20
  actions :all, :except => [:new]

  filter :name_or_surname_cont, as: :string, label: "ФИО"

  index do
    selectable_column
    id_column
    column t :photo do |img|
      image_tag(img.photo.url(:thumb)) if img.photo.present?
    end
    column 'ФИО' do |citizen|
      span(link_to("#{citizen.surname} #{citizen.name} #{citizen.father_name}", admin_citizen_path(citizen)))
    end
    column t :birthday do |citizen|
      citizen.birthday
    end
    column t :phone do |citizen|
      citizen.phone
    end
    column "Дата регистрации" do |citizen|
      citizen.created_at
    end
    actions defaults: false do |citizen|
      span(link_to "Печать", registration_data_admin_citizen_path(citizen.id), target: "_blank")
    end
  end

  show do |citizen|

    panel "Основные данные" do
      attributes_table_for citizen do

        row t :photo do |img|
          image_tag(img.photo.url(:medium)) if img.photo.present?
        end
        row t :surname do
          citizen.surname
        end
        row t :name do
          citizen.name
        end
        row t :father_name do
          citizen.father_name
        end
        row t :birthday do
          citizen.birthday
        end
        row t :nationality do
          citizen.nationality
        end
        row t :marital_status do
          citizen.marital_status
        end
        row t :spouse_name do
          citizen.spouse_name
        end

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

        row t :education do
          citizen.education
        end
        row t :departure_reason do
          citizen.departure_reason
        end
        row t :last_kaz_address do
          citizen.last_kaz_address
        end
        row t :kaz_work_place do
          citizen.kaz_work_place
        end
        row t :current_country do
          citizen.current_country
        end
        row t :current_address do
          citizen.current_address
        end
        row t :phone do
          citizen.phone
        end
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

  member_action :registration_data, method: :get do
      @citizen = Citizen.find(params[:id])
      output = CitizenCard.new(@citizen)
      send_data output.render, :type => 'application/pdf', :filename => "#{@citizen.surname}-#{@citizen.name}.pdf", :disposition => "inline"
  end
end
