class AddTranslatesToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :en_title, :string
    add_column :articles, :en_content, :text
    add_column :articles, :kz_title, :string
    add_column :articles, :kz_content, :text
  end
end
