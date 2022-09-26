class CreateSignups < ActiveRecord::Migration[6.1]
  def change
    create_table :signups do |t|
      t.integer :time
      t.integer :camper_id, null: false, foreign_key: true
      t.integer :activity_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
