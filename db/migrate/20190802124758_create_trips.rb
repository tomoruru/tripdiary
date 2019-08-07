class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :where
      t.string :transpotation
      t.string :hotel
      t.string :what_did
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
