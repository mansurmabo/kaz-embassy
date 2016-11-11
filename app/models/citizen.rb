class Citizen < ActiveRecord::Base
  has_one :citizen_passport, dependent: :destroy
  has_many :citizen_relations, dependent: :destroy

  accepts_nested_attributes_for :citizen_passport
  accepts_nested_attributes_for :citizen_relations

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  validates_presence_of :name, :surname, :father_name, :birthday, :nationality, :education, :departure_reason, :last_kaz_address, :kaz_work_place, :current_country, :current_address, :phone


  def fullname
    self.surname + self.name + self.father_name
  end
end
