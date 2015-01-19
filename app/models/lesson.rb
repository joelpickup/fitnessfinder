class Lesson < ActiveRecord::Base
  belongs_to :instructor, class_name: 'User'
  has_many :bookings
  validate :name, :description, :price, :instructor_id, presence: :true
end
