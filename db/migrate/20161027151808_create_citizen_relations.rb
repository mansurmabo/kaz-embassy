class CreateCitizenRelations < ActiveRecord::Migration
  def change
    create_table :citizen_relations do |t|

      t.timestamps null: false
    end
  end
end
