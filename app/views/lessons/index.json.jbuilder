json.array!(@lessons) do |lesson|
  json.extract! lesson, :id, :name, :description, :duration, :price, :instructor_id
  json.url lesson_url(lesson, format: :json)
end
