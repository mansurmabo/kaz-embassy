class Article < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search_by_title_content, :against => [:title, :content]

  belongs_to :type
  has_attached_file :image, styles: { medium: "300x220#", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates :title, :presence => true
  validates :content, :presence => true
end
