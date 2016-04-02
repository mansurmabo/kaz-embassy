class AddImagesCategoryToGalleries < ActiveRecord::Migration
  def change
    add_reference :galleries, :images_category, index: true, foreign_key: true
  end
end
