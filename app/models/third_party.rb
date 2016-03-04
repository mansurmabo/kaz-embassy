class ThirdParty < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "300x300>", thumb: "200x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates_attachment_presence :image

  validates :link, :presence => true
  validates :link, :format => URI::regexp(%w(http https))

end
