class Booking < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :instructor, class_name: 'User'
  belongs_to :client, class_name: 'User'
  validates :lesson_id, :instructor_id, :client_id, :start_time, presence: :true
  validate :instructor_and_client_must_be_different, on: :create
  validate :instructor_must_be_lesson_instructor, on: :create

  before_save :default_status

  def default_status
    self.status = "unapproved"
  end

  def instructor_and_client_must_be_different
    if client_id == instructor_id
      errors.add(:client_id, "you cannot create a booking with yourself")
    end
  end

  def instructor_must_be_lesson_instructor
    unless lesson.instructor_id == instructor_id
      errors.add(:instructor_id, "this instructor does not teach this lesson")
    end
  end
end
