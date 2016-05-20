class CreateManifestos < ActiveRecord::Migration
  def change
    create_table :manifestos do |t|
      t.string :title
      t.string :en_title
      t.string :kz_title
      t.text :content
      t.text :en_content
      t.text :kz_content

      t.timestamps null: false
    end
  end
end
