class CreateFeedingTimes < ActiveRecord::Migration[7.0]
  def change
    create_table :feeding_times do |t|
      t.references :cat, null: false, foreign_key: true
      t.datetime :datetime

      t.timestamps
    end
  end
end
