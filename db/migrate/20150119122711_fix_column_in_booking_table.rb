class FixColumnInBookingTable < ActiveRecord::Migration
  def change
    rename_column :bookings, :class_id, :lesson_id
  end
end
