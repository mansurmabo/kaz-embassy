class CreateImagesCategories < ActiveRecord::Migration
  def change
    create_table :images_categories do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
