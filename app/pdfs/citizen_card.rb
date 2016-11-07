class CitizenCard < Prawn::Document

  def initialize(citizen)
    super()
    @citizen = citizen
    @passport = @citizen.citizen_passport
    @passport_people = @passport.passport_people
    @relations_in_kz = @citizen.citizen_relations.where(in_kz: true)
    @relations_out_kz = @citizen.citizen_relations.where(in_kz: false)
    add_font
    header
    main
    passport
    passport_people if @passport_people.present?
    description
    relations_in_kz if @relations_in_kz.present?
    relations_out_kz if @relations_out_kz.present?
    footer
  end

  def add_font
    font_families.update("ubuntu" => {
        :normal => "app/assets/fonts/regular.ttf",
        :italic => "app/assets/fonts/italic.ttf",
        :bold => "app/assets/fonts/bold.ttf",
    })
    font "ubuntu",
         :size => 12
  end

  def header
    text "Регистрационная карточка граждан Республики Казахстан, проживающих за границей",
         :align => :center, :style => :bold, :size => 16, color: "7D7874"

  end

  def main
    move_down 25

    text "Основные данные",
         :align => :center, :style => :bold, :size => 14
    move_down 15
    if @citizen.photo.present?
      image @citizen.photo.path(:thumb), :at => [400, 620]
    end
    move_down 15

    text "Фамилия: #{@citizen.surname}"
    text "Имя: #{@citizen.name}"
    text "Отчество: #{@citizen.father_name}"
    text "Прежняя фамилия: #{@citizen.old_surname}" if @citizen.old_surname.present?
    text "Дата Рождения: #{ @citizen.birthday.strftime('%d-%m-%Y') }"
    text "Национальность: #{@citizen.nationality}"
    married = @citizen.marital_status ? "Да" : "Нет"
    text "В браке: #{married}"

    if @citizen.marital_status
      text "ФИО супргуги/а: #{@citizen.spouse_name}"
    end
  end

  def passport
    move_down 25
    text "Паспортные данные",
         :align => :center, :style => :bold, :size => 14
    move_down 15

    text "Тип проездного документа: #{@passport.pass_type}"
    text "Cерия: #{@passport.series}"
    text "Номер: #{@passport.number}"
    text "Дата выдачи: #{@passport.date_of_issue.strftime('%d-%m-%Y')}"
    text "Срок действия: #{@passport.date_of_validity.strftime('%d-%m-%Y')}"
    text "Кем выдан: #{@passport.issued_by}"

  end

  def passport_people
    move_down 25
    text "Лица внесенные в паспорт",
         :align => :center, :style => :bold, :size => 14
    move_down 15

    @passport_people.each do |person|
      text "ФИО: #{person.fullname}"
      text "Дата Рождения: #{person.birthday.strftime('%d-%m-%Y')}"
    end
  end

  def description
    move_down 25
    text "Дополнительные данные",
         :align => :center, :style => :bold, :size => 14
    move_down 15
    text "Образование и специальность: #{@citizen.education}"
    text "Когда и в связи с чем выехали за границу: #{@citizen.departure_reason}"
    text "Последний адрес в РК: #{@citizen.last_kaz_address}"
    text "Место работы или учебы в РК: #{@citizen.kaz_work_place}"
    text "Принятие гражд. стр. пребывания: #{@citizen.current_country}"
    text "Адрес в стране пребывания: #{@citizen.current_address}"
    text "Телефон: #{@citizen.phone}"
  end

  def relations_in_kz
    move_down 25
    text "Родственники в Республике Казахстан",
         :align => :center, :style => :bold, :size => 14
    move_down 15
    @relations_in_kz.each do |person|
      text "ФИО, данные: #{person.fullname}"
    end
  end

  def relations_out_kz
    move_down 25
    text "Родственники за пределами Республики Казахстан, в том числе и в стране пребывания",
         :align => :center, :style => :bold, :size => 14
    move_down 15
    @relations_out_kz.each do |person|
      text "ФИО, данные: #{person.fullname}"
    end
  end

  def footer
    move_down 25
    text "*Место регистрации, Консульский отдел Посольтва Республики Казахстан в Кыргызской Республике."
    move_down 20
    text "Дата: #{Date.today.strftime('%d-%m-%Y')}",
         :align => :right, :style => :normal, :size => 14
  end

end