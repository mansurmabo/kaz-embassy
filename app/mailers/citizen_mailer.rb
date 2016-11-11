class CitizenMailer < ApplicationMailer

  def new_citizen(citizen)
    @citizen = citizen
    mail(to: "kazembassykg@gmail.com", subject: "#{@citizen.fullname} прошел регистрацию.")
  end
end
