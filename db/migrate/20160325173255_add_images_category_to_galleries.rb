class AddImagesCategoryToGalleries < ActiveRecord::Migration
  def change
    add_reference :galleries, :imagescategory, index: true, foreign_key: true
  end
end
