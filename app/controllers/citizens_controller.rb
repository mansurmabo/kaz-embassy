class CitizensController < ApplicationController

  def new
    @citizen = Citizen.new
  end

  def create
    @citizen = Citizen.n
  end

  private

  def citizen_params
    params.require(:citizen).permit(
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
        :phone
    )
  end

end
