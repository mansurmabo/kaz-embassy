class PassportPerson < ActiveRecord::Base
  belongs_to :citizen_passport

  validates_presence_of :fullname
end
