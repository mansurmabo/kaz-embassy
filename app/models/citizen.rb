class Citizen < ActiveRecord::Base
  has_one :citizen_passport
  has_many :citizen_relations

  accepts_nested_attributes_for :citizen_passport
  accepts_nested_attributes_for :citizen_relations

end
