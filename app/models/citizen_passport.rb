class CitizenPassport < ActiveRecord::Base
  belongs_to :citizen
  has_many :passport_people

  accepts_nested_attributes_for :passport_people

end
