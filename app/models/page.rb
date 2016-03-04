class Page < ActiveRecord::Base
  belongs_to :categories

  validates :title, :presence => true
  validates :content, :presence => true
end
