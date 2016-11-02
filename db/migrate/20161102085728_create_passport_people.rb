class CreatePassportPeople < ActiveRecord::Migration
  def change
    create_table :passport_people do |t|
      t.integer :citizen_passport_id
      t.string  :fullname
      t.date    :birthday

      t.timestamps null: false
    end
  end
end
