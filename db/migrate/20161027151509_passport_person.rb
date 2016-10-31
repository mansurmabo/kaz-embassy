class PassportPerson < ActiveRecord::Migration
  def change
    create_table :passport_persons do |t|
      t.integer :citizen_passport_id
      t.string  :fullname
      t.date    :birthday

      t.timestamps null: false
    end
  end
end
