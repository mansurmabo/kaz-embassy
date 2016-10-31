class CreateCitizens < ActiveRecord::Migration
  def change
    create_table :citizens do |t|
      t.string :surname
      t.string :old_surname
      t.string :name
      t.string :father_name
      t.date   :birthday
      t.string :nationality
      t.boolean :marital_status
      t.string :spouse_name
      t.string :photo

      t.string :education
      t.string :departure_reason
      t.string :last_kaz_address
      t.string :kaz_work_place

      t.string :current_country
      t.string :current_address
      t.string :phone

      t.timestamps null: false
    end
  end
end
