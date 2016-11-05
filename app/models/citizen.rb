class Citizen < ActiveRecord::Base
  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  has_one :citizen_passport
  has_many :citizen_relations

  accepts_nested_attributes_for :citizen_passport
  accepts_nested_attributes_for :citizen_relations

end
