class AddTranslatesToImagesCategory < ActiveRecord::Migration
  def change
    add_column :images_categories, :en_title, :string
    add_column :images_categories, :kz_title, :string
  end
end
