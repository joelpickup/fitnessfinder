class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :class_id
      t.datetime :start_time
      t.datetime :end_time
      t.string :status
      t.integer :instructor_id
      t.integer :client_id

      t.timestamps
    end
  end
end
