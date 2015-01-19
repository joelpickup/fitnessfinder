json.array!(@bookings) do |booking|
  json.extract! booking, :id, :class_id, :start_time, :end_time, :status, :instructor_id, :client_id
  json.url booking_url(booking, format: :json)
end
