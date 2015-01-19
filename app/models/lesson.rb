class Lesson < ActiveRecord::Base
  belongs_to :instructor, class_name: 'User'
  has_many :bookings
end
