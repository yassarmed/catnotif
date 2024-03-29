class CreateCatFeedings < ActiveRecord::Migration[7.0]
  def change
    create_table :cat_feedings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :cat, null: false, foreign_key: true
      t.datetime :datetime

      t.timestamps
    end
  end
end
