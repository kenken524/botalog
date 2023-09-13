class CreateCareRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :care_records do |t|
      t.references :user, null: false, foreign_key: true
      t.references :plant, null: false, foreign_key: true
      t.text :description, null: false
      t.date :care_date, null: false
      t.timestamps
    end
  end
end
