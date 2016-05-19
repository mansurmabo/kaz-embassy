class AddTranslatesToTypes < ActiveRecord::Migration
  def change
    add_column :types, :en_name, :string
    add_column :types, :kz_name, :string
  end
end
