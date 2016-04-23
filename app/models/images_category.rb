class ImagesCategory < ActiveRecord::Base
  has_many :galleries, :dependent => :restrict_with_error

end
