class CitizensController < ApplicationController

  def new
    @citizen = Citizen.new
    @passport = @citizen.build_citizen_passport
  end

  def create
    @citizen = Citizen.new(citizen_params)
    @passport = @citizen.build_citizen_passport
    @passport.update(passport_params)
    if @citizen.save
      @citizen_relations = @citizen.citizen_relations.create(citizen_relation_params)
      @passport_people = @passport.passport_people.create(passport_people_params)
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def permitted_params
    params.permit(
        citizen: [
            :name,
            :surname,
            :father_name,
            :old_surname,
            :birthday,
            :nationality,
            :marital_status,
            :spouse_name,
            :photo,
            :education,
            :departure_reason,
            :last_kaz_address,
            :kaz_work_place,
            :current_country,
            :current_address,
            :phone,
            citizen_passport_attributes: [:pass_type, :series, :number,
                                          :date_of_issue, :date_of_validity,
                                          :issued_by
            ]],
        passport_people: [:fullname, :birthday],
        citizen_relation: [:fullname, :in_kz]

    )
  end

  def citizen_params
    permitted_params[:citizen].except(:citizen_passport_attributes)
  end

  def passport_params
    permitted_params[:citizen][:citizen_passport_attributes].except(:passport_person)
  end

  def passport_people_params
    permitted_params[:passport_people].map { |pp| pp unless pp[:fullname].empty? }
  end

  def citizen_relation_params
    permitted_params[:citizen_relation].map { |cr| cr unless cr[:fullname].empty? }

  end
end
