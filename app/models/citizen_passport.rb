class CitizenPassport < ActiveRecord::Base
  belongs_to :citizen
  has_many :passport_people, dependent: :destroy

  accepts_nested_attributes_for :passport_people

  validates_presence_of :pass_type, :series, :number, :date_of_issue, :date_of_validity, :issued_by

end
