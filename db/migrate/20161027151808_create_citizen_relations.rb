class CreateCitizenRelations < ActiveRecord::Migration
  def change
    create_table :citizen_relations do |t|
      t.integer :citizen_id
      t.string :fullname
      t.boolean :in_kz

      t.timestamps null: false
    end
  end
end
