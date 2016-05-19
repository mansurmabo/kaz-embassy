class AddTranslatesToPages < ActiveRecord::Migration
  def change
    add_column :pages, :en_title, :string
    add_column :pages, :en_content, :text
    add_column :pages, :kz_title, :string
    add_column :pages, :kz_content, :text
  end
end
