class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.text :where
      t.text :transpotation
      t.text :hotel
      t.text :what_did
      t.string :image
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
