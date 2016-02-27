class CreateThirdParties < ActiveRecord::Migration
  def change
    create_table :third_parties do |t|
      t.string :link
      t.string :image

      t.timestamps null: false
    end
  end
end
