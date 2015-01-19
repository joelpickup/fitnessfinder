class Booking < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :instructor, class_name: 'User'
  belongs_to :client, class_name: 'User'
  validates :lesson_id, :instructor_id, :client_id, :start_time, presence: :true
  validate :instructor_and_client_must_be_different, on: :create

  def instructor_and_client_must_be_different
    if client_id == instructor_id
      errors.add(:client_id, "you cannot create a booking with yourself")
    end
  end
end
