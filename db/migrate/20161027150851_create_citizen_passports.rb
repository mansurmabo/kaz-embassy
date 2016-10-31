class CreateCitizenPassports < ActiveRecord::Migration
  def change
    create_table :citizen_passports do |t|
      t.integer :citizen_id
      t.string :type
      t.string :series
      t.string :number
      t.date :date_of_issue
      t.date :date_of_validity
      t.string :issued_by

      t.timestamps null: false
    end
  end
end
