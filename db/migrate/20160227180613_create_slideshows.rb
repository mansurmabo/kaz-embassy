class CreateSlideshows < ActiveRecord::Migration
  def change
    create_table :slideshows do |t|
      t.string :title
      t.string :image

      t.timestamps null: false
    end
  end
end
