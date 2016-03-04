class Slideshow < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "300x250#", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_presence :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/


end
