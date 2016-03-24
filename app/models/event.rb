class Event < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "300x300>", thumb: "200x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates :title, :presence => true
  validates :date, :presence => true

end
