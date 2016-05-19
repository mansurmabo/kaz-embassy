class AddEnNameToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :en_name, :string
    add_column :categories, :kz_name, :string
  end
end
