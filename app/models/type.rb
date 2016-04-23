class Type < ActiveRecord::Base
  has_many :articles, :dependent => :restrict_with_error
  validates :name, :presence => true

end
