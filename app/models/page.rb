class Page < ActiveRecord::Base
  belongs_to :categories

  validates :title, :presence => true
end
