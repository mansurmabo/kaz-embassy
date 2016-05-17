class Article < ActiveRecord::Base
  searchkick

  belongs_to :type
  has_attached_file :image, styles: { medium: "300x220#", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates :title, :presence => true
  validates :content, :presence => true
end

#Article.reindex