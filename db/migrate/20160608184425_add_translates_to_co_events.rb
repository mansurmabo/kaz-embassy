class AddTranslatesToCoEvents < ActiveRecord::Migration
  def change
    add_column :co_events, :en_title, :string
    add_column :co_events, :en_content, :text
    add_column :co_events, :kz_title, :string
    add_column :co_events, :kz_content, :text
  end
end
