class Page < ActiveRecord::Base
  belongs_to :categories

  validates :title, :presence => true
  validates :category_id, :presence => true
end
