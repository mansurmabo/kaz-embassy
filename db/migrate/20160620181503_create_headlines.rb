class CreateHeadlines < ActiveRecord::Migration
  def change
    create_table :headlines do |t|
      t.string :title, null: false
      t.string :kz_title
      t.string :en_title
      t.integer :font_size
      t.string :font_color
      t.string :color
      t.integer :height
      t.string :url
      t.boolean :show, default: false
      t.string :image

      t.timestamps null: false
    end
  end
end
