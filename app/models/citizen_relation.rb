class CitizenRelation < ActiveRecord::Base
  belongs_to :citizen

  validates_presence_of :fullname
end
