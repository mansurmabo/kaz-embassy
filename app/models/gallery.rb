class Gallery < ActiveRecord::Base
  has_attached_file :image, styles: { large: "600x400", medium: "260x200>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
