class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.date :date_st
      t.date :date_end
      t.string :image
      t.string :site

      t.timestamps null: false
    end
  end
end
