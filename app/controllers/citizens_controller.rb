class CitizensController < ApplicationController

  def new
    @citizen = Citizen.new
    @passport = @citizen.build_citizen_passport
  end

  def create
    @citizen = Citizen.create(citizen_params)
    @passport = @citizen.build_citizen_passport
    if @citizen.valid?
      @citizen_relations = @citizen.citizen_relations.create(citizen_relation_params)
      @passport = @citizen.create_citizen_passport(passport_params)
      if @passport.valid?
        @passport_people = @passport.passport_people.create(passport_people_params)
      else
        render 'new'
      end

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
                                          :issued_by,
                                          passport_person: [:fullname, :birthday]
            ]],
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
    permitted_params[:citizen][:citizen_passport_attributes][:passport_person]
  end

  def citizen_relation_params
    permitted_params[:citizen_relation].map { |cr| cr unless cr[:fullname].empty? }

  end
end
