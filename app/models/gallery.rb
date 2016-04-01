class Gallery < ActiveRecord::Base

  belongs_to :images_category

  has_attached_file :image, styles: { large: "640x400>", medium: "256x200>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_presence :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end

