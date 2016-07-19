class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :customername
      t.string :location
      t.string :roomnumber
      t.datetime :startdatetime
      t.datetime :enddatetime
      t.string :pinnumber
      t.string :mobile
      t.string :cleanername
      t.string :roomtype

      t.timestamps null: false
    end
  end
end
