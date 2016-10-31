class Citizen < ActiveRecord::Base
  has_one :citizen_passport
  has_many :citizen_relations
end
