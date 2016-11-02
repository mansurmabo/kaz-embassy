class CitizenPassport < ActiveRecord::Base
  belongs_to :citizen
  has_many :passport_persons

  accepts_nested_attributes_for :passport_persons

end
