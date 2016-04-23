class AddRepeatToEvents < ActiveRecord::Migration
  def change
    add_column :events, :repeat, :boolean, default: false
  end
end
